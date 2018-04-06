# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=flatbuffers-static
_pkgname=flatbuffers
pkgver=1.8.0
pkgrel=1
pkgdesc='An efficient cross platform serialization library for C++, with support for Java, C# and Go'
arch=(x86_64)
url='http://google.github.io/flatbuffers/'
license=(Apache)
depends=(gcc-libs)
makedepends=(cmake)
options=('staticlibs')
source=($pkgname-$pkgver.tar.gz::https://github.com/google/$_pkgname/archive/v$pkgver.tar.gz)
sha256sums=('c45029c0a0f1a88d416af143e34de96b3091642722aa2d8c090916c6d1498c2e')
provides=('flatbuffers')
conflicts=('flatbuffers')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

check() {
  cd build
  make test
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm755 flatc -t "$pkgdir"/usr/bin
}
