# Maintainer: robertfoster
pkgname=xplico
pkgver=1.2.1
pkgrel=2
arch=(i686 x86_64)
pkgdesc="Internet Traffic Decoder. Network Forensic Analysis Tool (NFAT)"
url="http://www.xplico.org/"
license=('GPL')
depends=(
	apache
	json-c
	lame
	libmysqlclient
	libnet
	libpcap
	ndpi
	net-tools
	perl
	perl
	php
	php-apache
	php-pear
	php-sqlite
	python-httplib2
	python-psycopg2
	recode
	sox
	sqlite3
	tcpdump
) 
optdepends=('geoip-database-extra: City database for geoip IP location lookups'
	    'ghostpdl: reconstruct document printed with network printer'
	    'videosnarf: decode VoIP based on RTP')
source=("https://github.com/xplico/xplico/archive/v$pkgver.tar.gz"
	1ed30f322b764cbb6d027775c275e4f0a5616a3f.patch
)
install=xplico.install

build() {
  cd $pkgname-$pkgver 
  patch -Np1 -i ../1ed30f322b764cbb6d027775c275e4f0a5616a3f.patch
  make -j1
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install    
  ln -sr /usr/share/GeoIP/GeoIPCity.dat $pkgdir/opt/xplico/GeoLiteCity.dat
}

md5sums=('b16b1f1dc8520b3bbc5c3cd9439ca38a')
md5sums=('b16b1f1dc8520b3bbc5c3cd9439ca38a'
         '813a0ca8e13f674d3458173f90ac2e94')
