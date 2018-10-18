# Maintainer: Can Celasun <can[at]dcc[dot]im>
pkgname=netsniff-ng
pkgver=0.6.5
pkgrel=1
pkgdesc='A high performance Linux network sniffer for packet inspection.'
arch=('i686' 'x86_64')
url='http://netsniff-ng.org/'
license=('GPL2')
makedepends=('cmake' 'flex' 'bison')
depends=('ncurses' 'geoip' 'zlib' 'libnetfilter_conntrack' 'libpcap' 'liburcu' 'libnl' 'libcli' 'libnet' 'libsodium')
source=(http://pub.netsniff-ng.org/netsniff-ng/netsniff-ng-${pkgver}.tar.gz
        netsniff-ng-${pkgver}.tar.gz.sig::http://pub.netsniff-ng.org/netsniff-ng/netsniff-ng-${pkgver}.tar.gz.sign)
md5sums=('09988301e4701f97ecbaee0903ac169d'
         'SKIP')
validpgpkeys=('C3DE742283C246F2D7887AB4236B0FE9B5510F47')  # Tobias Klauser <tklauser@distanz.ch>
build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  NACL_INC_DIR=/usr/include/sodium NACL_LIB=sodium ./configure --prefix=/usr
  make DISTRO=1 all
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make PREFIX="/usr" DESTDIR="${pkgdir}" SBINDIR="/usr/bin" install_all
}
