# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=mingw-w64-directxmath
pkgdesc="All inline SIMD C++ linear algebra library for use in games and graphics apps (mingw-w64)"
# Version from CMakeLists.txt.
pkgver=3.20
_tag=apr2025
pkgrel=1
arch=('any')
makedepends=('mingw-w64-cmake')
url="https://go.microsoft.com/fwlink/?LinkID=615560"
license=('MIT')
options=('!debug' 'staticlibs' '!strip' '!buildflags')
source=(directxmath-${_tag}.tar.gz::https://github.com/microsoft/DirectXMath/archive/refs/tags/${_tag}.tar.gz)
sha256sums=('8ac7f060d7fcc971d77c5a9f3ff98548ecf119c144a7c2dd9d21f4b66ba94cd4')

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
