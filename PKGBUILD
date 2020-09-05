# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Carsten Feuls <archlinux at carstenfeuls dot de>

pkgname=gfs2-utils
pkgver=3.3.0
pkgrel=1
pkgdesc="Utilities for managing the global file system (GFS2)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="https://sourceware.org/cluster/gfs/"
depends=('python')
makedepends=('util-linux' 'check')
source=("https://releases.pagure.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
options=('staticlibs')
sha512sums=('62992ae948681370f4608d1d5c68067f5b31890c2a5ce57ee15ff0a77503b5e305734f5adb1979a427e274060b1fd53a602b557d08d826f6462f3a0b82fcf598')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  bzip2_CFLAGS+=" " \
  bzip2_LIBS+=" -lbz2" \
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/$pkgname
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check || true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
