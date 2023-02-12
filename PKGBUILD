# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Carsten Feuls <archlinux at carstenfeuls dot de>

pkgname=gfs2-utils
pkgver=3.5.0
pkgrel=1
pkgdesc="Utilities for managing the global file system (GFS2)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="https://sourceware.org/cluster/gfs/"
depends=('python')
makedepends=('util-linux' 'check')
source=("https://releases.pagure.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
options=('staticlibs' '!debug')
sha512sums=('fc5524bdc405e4c7ea40aab624331c38c4af77f3cf733c44189ae7e340acab326ace542b739c257fc82d9217c873dd350aa7bc5d6506269e9eb84ffca93070ad')

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
