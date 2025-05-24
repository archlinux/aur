# Maintainer: Can Celasun <can[at]dcc[dot]im>
pkgname=netsniff-ng-git
_gitname=netsniff-ng
pkgver=v0.6.9.8.gbdd5a28e
pkgrel=1
pkgdesc='High performance Linux network sniffer for packet inspection (git version).'
arch=('x86_64')
url='http://netsniff-ng.org/'
license=('GPL2')
provides=('netsniff-ng')
conflicts=('netsniff-ng')
depends=('glibc' 'ncurses' 'libncursesw.so' 'geoip' 'zlib' 'libnetfilter_conntrack'
         'libpcap' 'libpcap.so' 'liburcu' 'libnl' 'libcli' 'libcli.so' 'libnet' 'libsodium')
makedepends=('cmake' 'flex' 'bison')
source=('git+https://github.com/netsniff-ng/netsniff-ng.git')
sha512sums=('SKIP')
pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd ${_gitname}
  NACL_INC_DIR=/usr/include/sodium
  NACL_LIB=sodium
  ./configure \
    --prefix=/usr
  make all Q= CFLAGS="${CFLAGS} ${CPPFLAGS}"
}

package() {
  cd ${_gitname}
  make PREFIX=/usr DESTDIR="${pkgdir}" SBINDIR=/usr/bin install_all -j1
}
