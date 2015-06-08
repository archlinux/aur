# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=netsniff-ng
pkgver=0.5.9
_pkgver=${pkgver}
pkgrel=2
pkgdesc='A high performance Linux network sniffer for packet inspection (without curvetun tool).'
arch=('i686' 'x86_64')
url='http://netsniff-ng.org/'
license=('GPL2')
md5sums=('f62d7d9f1567c8ef80e2650428baee9d')
makedepends=('cmake' 'flex' 'bison')
depends=('ncurses' 'geoip' 'zlib' 'libnetfilter_conntrack' 'libpcap' 'liburcu' 'libnl' 'libcli' 'libnet')
optdepends=('libnacl: Needed for curvetun')
source=(http://pub.netsniff-ng.org/netsniff-ng/netsniff-ng-${_pkgver}.tar.gz)

build() {
  cd "${srcdir}"/${pkgname}-${_pkgver}
  ./configure
  make DISTRO=1 allbutmausezahn
}

package() {
  cd "${srcdir}"/${pkgname}-${_pkgver}
  make PREFIX="/usr" DESTDIR="${pkgdir}" SBINDIR="/usr/bin" install_allbutmausezahn
}
