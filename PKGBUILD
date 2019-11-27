# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=coin-or-ipopt
pkgver=3.12.13
pkgrel=1
epoch=1
pkgdesc="Interior Point OPTimizer"
arch=('i686' 'x86_64')
url="https://github.com/coin-or/Ipopt"
license=('EPL')
groups=('coin-or')
depends=('lapack')
makedepends=('gcc-fortran' 'wget')
source=("http://www.coin-or.org/download/source/Ipopt/Ipopt-$pkgver.tgz")
sha256sums=('aac9bb4d8a257fdfacc54ff3f1cbfdf6e2d61fb0cf395749e3b0c0664d3e7e96')

prepare(){
  cd "$srcdir/Ipopt-$pkgver/ThirdParty/ASL" && ./get.ASL
  cd "$srcdir/Ipopt-$pkgver/ThirdParty/Metis" && ./get.Metis
  cd "$srcdir/Ipopt-$pkgver/ThirdParty/Mumps" && ./get.Mumps
}

build() {
  cd "$srcdir"
  mkdir -p build && pushd build
  "$srcdir/Ipopt-$pkgver/./configure" --prefix=/usr
  make
}

check() {
  cd "$srcdir/build"
  make tests
}

package() {
  cd "$srcdir/build"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir/" install
}
