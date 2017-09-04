# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=countly-cpp
pkgver=16.9.1
pkgrel=1
pkgdesc="Lightweight C++ library for Countly"
arch=('i686' 'x86_64')
url="https://github.com/ryuichis/countly-cpp"
license=(Apache2)
depends=()
makedepends=()
source=(https://github.com/ryuichis/${pkgname}/archive/${pkgver}.tar.gz
        'countly-cpp.patch')
md5sums=('4de00996bad6a2afc02da1c001902bdb'
         '7022abb22604b48f50f75ce834af4847')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < $srcdir/countly-cpp.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p $pkgdir/usr/lib
  cp -r ./lib/libCountly.a $pkgdir/usr/lib/

  mkdir -p $pkgdir/usr/include
  cp -r ./include/countly $pkgdir/usr/include/
}

# vim:set ts=2 sw=2 et:
