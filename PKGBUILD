# Maintainer: SanskritFritz (gmail)

pkgname=netdata-git
_gitname=netdata
pkgver=v1.5.0.r485.g360b3624
pkgrel=1
pkgdesc="Real-time performance monitoring, in the greatest possible detail, over the web."
url="https://github.com/firehol/netdata/wiki"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libutil-linux' 'libmnl' 'libnetfilter_acct' 'zlib')
optdepends=('nodejs: Webbox plugin'
            'lm_sensors: sensors module'
            'libcap: apps plugin')
source=("$_gitname::git+https://github.com/firehol/netdata")
provides=('netdata')
conflicts=('netdata')
install="$pkgname.install"

pkgver() {
	cd "$_gitname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_gitname"

	./autogen.sh
	./configure \
		--prefix="/usr" \
		--sbindir="/usr/bin" \
		--sysconfdir="/etc" \
		--libexecdir="/usr/lib" \
		--localstatedir="/var" \
		--with-zlib --with-math --with-user=netdata \
		CFLAGS="-O3"
	make
}

package() {
	cd "$_gitname"

	make DESTDIR="$pkgdir" install

	touch "$pkgdir/etc/netdata/netdata.conf"
 	install -Dm0644 "system/netdata.service" "$pkgdir/usr/lib/systemd/system/netdata.service"
}

md5sums=('SKIP')

# find pkg/netdata-git/etc/netdata -type f | cut -c '17-' | awk '{line=line $0 " "} END{print "backup=(" line ")"}' >> PKGBUILD
backup=(etc/netdata/health_email_recipients.conf etc/netdata/charts.d/cpu_apps.conf etc/netdata/charts.d/exim.conf etc/netdata/charts.d/nginx.conf etc/netdata/charts.d/cpufreq.conf etc/netdata/charts.d/squid.conf etc/netdata/charts.d/mem_apps.conf etc/netdata/charts.d/opensips.conf etc/netdata/charts.d/apache.conf etc/netdata/charts.d/mysql.conf etc/netdata/charts.d/example.conf etc/netdata/charts.d/nut.conf etc/netdata/charts.d/apcupsd.conf etc/netdata/charts.d/sensors.conf etc/netdata/charts.d/postfix.conf etc/netdata/charts.d/ap.conf etc/netdata/charts.d/phpfpm.conf etc/netdata/charts.d/tomcat.conf etc/netdata/charts.d/load_average.conf etc/netdata/charts.d/hddtemp.conf etc/netdata/health.d/web_log.conf etc/netdata/health.d/redis.conf etc/netdata/health.d/entropy.conf etc/netdata/health.d/bind_rndc.conf etc/netdata/health.d/swap.conf etc/netdata/health.d/fping.conf etc/netdata/health.d/tcp_resets.conf etc/netdata/health.d/udp_errors.conf etc/netdata/health.d/varnish.conf etc/netdata/health.d/named.conf etc/netdata/health.d/backend.conf etc/netdata/health.d/nginx.conf etc/netdata/health.d/haproxy.conf etc/netdata/health.d/cpu.conf etc/netdata/health.d/net.conf etc/netdata/health.d/retroshare.conf etc/netdata/health.d/isc_dhcpd.conf etc/netdata/health.d/qos.conf etc/netdata/health.d/squid.conf etc/netdata/health.d/ipfs.conf etc/netdata/health.d/ipc.conf etc/netdata/health.d/memory.conf etc/netdata/health.d/postgres.conf etc/netdata/health.d/memcached.conf etc/netdata/health.d/apache.conf etc/netdata/health.d/mysql.conf etc/netdata/health.d/mdstat.conf etc/netdata/health.d/elasticsearch.conf etc/netdata/health.d/netfilter.conf etc/netdata/health.d/disks.conf etc/netdata/health.d/ram.conf etc/netdata/health.d/softnet.conf etc/netdata/apps_groups.conf etc/netdata/fping.conf etc/netdata/node.d.conf etc/netdata/netdata.conf etc/netdata/python.d.conf etc/netdata/stream.conf etc/netdata/charts.d.conf etc/netdata/health_alarm_notify.conf etc/netdata/node.d/README.md etc/netdata/node.d/named.conf.md etc/netdata/node.d/snmp.conf.md etc/netdata/node.d/sma_webbox.conf.md etc/netdata/python.d/web_log.conf etc/netdata/python.d/redis.conf etc/netdata/python.d/bind_rndc.conf etc/netdata/python.d/ovpn_status_log.conf etc/netdata/python.d/varnish.conf etc/netdata/python.d/exim.conf etc/netdata/python.d/nginx.conf etc/netdata/python.d/haproxy.conf etc/netdata/python.d/dovecot.conf etc/netdata/python.d/cpufreq.conf etc/netdata/python.d/mongodb.conf etc/netdata/python.d/retroshare.conf etc/netdata/python.d/isc_dhcpd.conf etc/netdata/python.d/squid.conf etc/netdata/python.d/ipfs.conf etc/netdata/python.d/freeradius.conf etc/netdata/python.d/postgres.conf etc/netdata/python.d/memcached.conf etc/netdata/python.d/apache.conf etc/netdata/python.d/mysql.conf etc/netdata/python.d/example.conf etc/netdata/python.d/mdstat.conf etc/netdata/python.d/elasticsearch.conf etc/netdata/python.d/smartd_log.conf etc/netdata/python.d/fail2ban.conf etc/netdata/python.d/sensors.conf etc/netdata/python.d/postfix.conf etc/netdata/python.d/phpfpm.conf etc/netdata/python.d/tomcat.conf etc/netdata/python.d/apache_cache.conf etc/netdata/python.d/hddtemp.conf )
