# Maintainer: saxonbeta <saxonbeta at gmail>
# Contributor: masutu < masutu dot arch at gmail dot com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Cuneyt Unlu <unlucu AT gmail.com>

pkgname=fityk
pkgver=1.3.2
pkgrel=1
pkgdesc="A program for nonlinear fitting of analytical functions to data."
arch=(i686 x86_64)
url="http://fityk.nieto.pl/"
license=('GPL')
depends=('lua' 'wxwidgets-gtk3' 'xylib>=1.4')
makedepends=('boost' 'swig')
options=(!libtool)
source=("https://github.com/wojdyr/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('6da5eb6279d90b241108e36c2d4880cafec82d7225a5d49a28675a07b4360f0b')


prepare(){
  cd "$srcdir/$pkgname-$pkgver"
  #patch -p1 < ../gtk3_fix.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure CXXFLAGS="${CXXFLAGS} -std=c++14" --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
