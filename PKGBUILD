# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=coin-or-ipopt
pkgver=3.13.0
pkgrel=1
pkgdesc="Interior Point OPTimizer"
arch=('i686' 'x86_64')
url="https://github.com/coin-or/Ipopt"
license=('EPL')
groups=('coin-or')
depends=('gcc-libs' 'lapack' 'java-runtime')
makedepends=('gcc-fortran' 'wget' 'java-environment' 'graphviz' 'doxygen')
source=("http://www.coin-or.org/download/source/Ipopt/Ipopt-$pkgver.tgz")
sha256sums=('dc392396be28c4a0d49bfab399320cb3f70db5b8f090028a883d826a47744ecf')

build() {
  mkdir -p ${srcdir}/build && cd ${srcdir}/build
  "../Ipopt-releases-$pkgver/configure" --prefix=/usr \
    --without-mumps \
    --without-asl \
    --enable-java
  make
}

check() {
  cd "$srcdir/build"
  make tests
}

package() {
  cd "$srcdir/build"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="${pkgdir}" install
}

