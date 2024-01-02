# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=mingw-w64-directxmath
pkgdesc="All inline SIMD C++ linear algebra library for use in games and graphics apps (mingw-w64)"
# Version from CMakeLists.txt.
pkgver=3.1.8
_tag=dec2023
pkgrel=2
arch=('any')
makedepends=('mingw-w64-cmake')
url="https://go.microsoft.com/fwlink/?LinkID=615560"
license=('MIT')
options=('staticlibs' '!strip' '!buildflags')
source=(directxmath-${_tag}.tar.gz::https://github.com/microsoft/DirectXMath/archive/refs/tags/${_tag}.tar.gz)
sha256sums=('cdc09f55a9999497d8c350d1c8c0e3f0fe92055cbf5490a2c319f9625080dc13')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    ${_arch}-cmake -S DirectXMath-$_tag -B build/${_arch}
    cmake --build build/${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install build/${_arch}
  done
}
