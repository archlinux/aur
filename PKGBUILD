# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Carsten Feuls <archlinux at carstenfeuls dot de>

pkgname=gfs2-utils
pkgver=3.5.1
pkgrel=1
pkgdesc="Utilities for managing the global file system (GFS2)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="https://sourceware.org/cluster/gfs/"
depends=('python')
makedepends=('util-linux' 'check')
source=("https://releases.pagure.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
options=('staticlibs' '!debug')
sha512sums=('4b35823a69d4e978dd950bb18dc88aa45e05f13ec216b60065260f0e000cd2e401380c628f4e3a5f3b9d030e3b928922a5e6515efb70618bf09a7a28fa10958b')

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
