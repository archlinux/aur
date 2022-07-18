# Maintainer: saxonbeta <saxonbeta at gmail>
# Contributor: masutu < masutu dot arch at gmail dot com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Cuneyt Unlu <unlucu AT gmail.com>

pkgname=fityk
pkgver=1.3.1
pkgrel=5
pkgdesc="A program for nonlinear fitting of analytical functions to data."
arch=(i686 x86_64)
url="http://fityk.nieto.pl/"
license=('GPL')
depends=('lua53' 'wxwidgets-gtk3' 'xylib>=1.4')
makedepends=('boost' 'swig')
options=(!libtool)
source=("https://github.com/wojdyr/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2"
        gtk3_fix.patch::"https://github.com/wojdyr/fityk/commit/85ea545db65d7c6fbb94988b85f1e8cf1c9cbba5.patch")
sha256sums=('3d88feb96dbdca70fbfb5f8fa994cea01e77723751e5957094ca46a0c6d511fe'
            'ffdad5780cdc3df78d0010134aa5339cdf8f93f3f5ab20e173ed01e3b5d5d27a')


prepare(){
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../gtk3_fix.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure LUA_INCLUDE=-I/usr/include/lua5.3 LUA=/usr/bin/lua5.3 CXXFLAGS="${CXXFLAGS} -std=c++14" --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
