# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=flatbuffers-static
_pkgname=flatbuffers
pkgver=1.9.0
pkgrel=1
pkgdesc='An efficient cross platform serialization library for C++, with support for Java, C# and Go'
arch=(x86_64)
url='http://google.github.io/flatbuffers/'
license=(Apache)
depends=(gcc-libs)
makedepends=(cmake)
options=('staticlibs')
source=($pkgname-$pkgver.tar.gz::https://github.com/google/$_pkgname/archive/v$pkgver.tar.gz)
sha256sums=('5ca5491e4260cacae30f1a5786d109230db3f3a6e5a0eb45d0d0608293d247e3')
provides=('flatbuffers')
conflicts=('flatbuffers')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_CXX_FLAGS="-Wno-ignored-qualifiers"
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
