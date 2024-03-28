# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=mingw-w64-directxmath
pkgdesc="All inline SIMD C++ linear algebra library for use in games and graphics apps (mingw-w64)"
# Version from CMakeLists.txt.
pkgver=3.1.9
_tag=feb2024b
pkgrel=1
arch=('any')
makedepends=('mingw-w64-cmake')
url="https://go.microsoft.com/fwlink/?LinkID=615560"
license=('MIT')
options=('staticlibs' '!strip' '!buildflags')
source=(directxmath-${_tag}.tar.gz::https://github.com/microsoft/DirectXMath/archive/refs/tags/${_tag}.tar.gz)
sha256sums=('01b700121697a923eaa8f7549c50625a10975b199a7ddb5decd6f59b4330fead')

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
