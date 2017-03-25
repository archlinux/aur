# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=netsniff-ng
pkgver=0.6.2
pkgrel=2
pkgdesc='A high performance Linux network sniffer for packet inspection.'
arch=('i686' 'x86_64')
url='http://netsniff-ng.org/'
license=('GPL2')
makedepends=('cmake' 'flex' 'bison')
depends=('ncurses' 'geoip' 'zlib' 'libnetfilter_conntrack' 'libpcap' 'liburcu' 'libnl' 'libcli' 'libnet' 'libsodium')
source=(http://pub.netsniff-ng.org/netsniff-ng/netsniff-ng-${pkgver}.tar.gz
        genl_id_generate.patch)
md5sums=('a5a5f910bf66ba123db7c584df466056'
         'aa119c49c89cc8cca25f1f785da75d48')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}"/genl_id_generate.patch
  NACL_INC_DIR=/usr/include/sodium NACL_LIB=sodium ./configure
  make DISTRO=1 allbutmausezahn
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make PREFIX="/usr" DESTDIR="${pkgdir}" SBINDIR="/usr/bin" install_allbutmausezahn
}
