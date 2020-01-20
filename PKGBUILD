# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=bamtools
pkgver=2.5.1
pkgrel=1
pkgdesc="C++ API & command-line toolkit for working with BAM data"
arch=('x86_64' 'i686')
url="https://github.com/pezmaster31/bamtools"
license=('custom')
depends=('gcc-libs' 'zlib')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/pezmaster31/bamtools/archive/v$pkgver.tar.gz)
sha512sums=('f2c761c5bf923cf2f3db3dc54e40b4781307106b9177784f930aab619bd11fae3b343f3cfd232524580d39f0526a2a2f18efcf820fe4d9c951406bdb6b953afb')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  sed -e '/set( CMAKE_BUILD_TYPE Release )/a set( CMAKE_CXX_FLAGS_RELEASE "-std=c++98 ${CMAKE_CXX_FLAGS_RELEASE}" )' \
      -i CMakeLists.txt

  mkdir -p build
}

build() {
  cd $srcdir/$pkgname-$pkgver/build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ..

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/build

  make DESTDIR=$pkgdir install

  install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
