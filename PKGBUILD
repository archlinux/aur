# Maintainer: robertfoster
pkgname=xplico
pkgver=1.2.2
pkgrel=1
arch=(i686 x86_64)
pkgdesc="Internet Traffic Decoder. Network Forensic Analysis Tool (NFAT)"
url="http://www.xplico.org/"
license=('GPL')
depends=(
	apache
	json-c
	lame
	mariadb-clients
	libmaxminddb
	libnet
	libpcap
	ndpi
	net-tools
	pecl-mcrypt
	perl
	php
	php-apache
	php-sqlite
	python-httplib2
	python-psycopg2
	recode
	sox
	sqlite3
	tcpdump
)
optdepends=('geoip2-database: City database for geoip IP location lookups'
	'ghostpdl: reconstruct document printed with network printer'
'videosnarf: decode VoIP based on RTP')
source=("https://github.com/xplico/xplico/archive/v.$pkgver.tar.gz"
"json-c.patch")
install=xplico.install

prepare() {
	cd $pkgname-v.$pkgver
	patch -Np1 -i ../json-c.patch
}

build() {
	cd $pkgname-v.$pkgver
	make -j1
}

package() {
	cd $pkgname-v.$pkgver
	make DESTDIR=$pkgdir install
	ln -sr /usr/share/GeoIP/GeoLite2-City.mmdb $pkgdir/opt/xplico/GeoLite2-City.mmdb
}

md5sums=('62013c924ecfd139b55e984fb95959ea'
'6184aa02ac099750cdc35b86dfd865e9')
