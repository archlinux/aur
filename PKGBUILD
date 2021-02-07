# Maintainer: robertfoster
pkgname=xplico
pkgver=1.2.2
pkgrel=2
arch=('i686' 'x86_64')
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
source=("https://github.com/xplico/xplico/archive/v.${pkgver}.tar.gz"
  init-detection.patch
  json-c.patch)
install=xplico.install

prepare() {
  cd ${pkgname}-v.${pkgver}
  patch -Np1 -i ../init-detection.patch
  patch -Np1 -i ../json-c.patch
}

build() {
  cd "${pkgname}-v.${pkgver}"
  make -j1
}

package() {
  cd "${pkgname}-v.${pkgver}"
  make DESTDIR="${pkgdir}" install
  ln -s /usr/share/GeoIP/GeoLite2-City.mmdb \
  "${pkgdir}/opt/xplico/GeoLite2-City.mmdb"
}

sha256sums=('9f9ba1ac038eedcb91c13a1879393f511e90a4f749de83ad40c57413369f9056'
            'a365905058d0dd29169011be41bf7fd1eb7f9c775e01788fd3637c803a314088'
            '17e363bfe2d9bf1faec5ccbe6d3c7480e8510c9cb14fd056a117329dff4fa94a')
