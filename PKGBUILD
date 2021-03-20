# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Carsten Feuls <archlinux at carstenfeuls dot de>

pkgname=gfs2-utils
pkgver=3.4.1
pkgrel=1
pkgdesc="Utilities for managing the global file system (GFS2)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="https://sourceware.org/cluster/gfs/"
depends=('python')
makedepends=('util-linux' 'check')
source=("https://releases.pagure.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
options=('staticlibs')
sha512sums=('35177da6714f7ebbd015fad1d76d10d31865d173772c6b83fd37c922c447acc042afdd81a9afbf620cbe5dd48ddb1f3b0fea2fb86576a43989cf0813f019ceb1')

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
