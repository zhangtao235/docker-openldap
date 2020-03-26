FROM debian:buster
MAINTAINER OpenLdap

RUN apt-get -y update \
    && LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends cron \
       ldap-utils \
       slapd \
       openssl \
       krb5-kdc-ldap \
       nscd \
       sssd \
       samba \
       curl \
       vim \
       lsof \
       net-tools \
       locales \
       gnutls-bin \
       ssl-cert \
       systemd-sysv \
       expect \
       libsasl2-modules \
       libsasl2-modules-db \
       libsasl2-modules-gssapi-mit \
       libsasl2-modules-ldap \
       libsasl2-modules-otp \
       libsasl2-modules-sql \
       procps && \
       cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
       locale-gen zh_CN.UTF-8 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
CMD sleep infinity  
#CMD ["/sbin/init"]
