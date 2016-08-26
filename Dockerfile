FROM quay.io/justcontainers/base

RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -q && \
    apt-get install -qy squid && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* 

ENV SQUID_CONF_DIR=/squid/conf \
    SQUID_CACHE_DIR=/squid/cache \
    SQUID_LOG_DIR=/squid/log 

COPY rootfs /

EXPOSE 3128/tcp

VOLUME [ '/squid' ]

ENTRYPOINT ["/init"]
