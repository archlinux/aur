# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Carsten Feuls <archlinux at carstenfeuls dot de>

pkgname=gfs2-utils
pkgver=3.4.0
pkgrel=1
pkgdesc="Utilities for managing the global file system (GFS2)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="https://sourceware.org/cluster/gfs/"
depends=('python')
makedepends=('util-linux' 'check')
source=("https://releases.pagure.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
options=('staticlibs')
sha512sums=('aee1dfc8b548ae8e2202c3bbfffb0ceea112eca8465760aa32074d4e526f2c2b1b0f10e8526a667e264d33612dd2b73c8690b16da67b794baf476c4458b5de7d')

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
