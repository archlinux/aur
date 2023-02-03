# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=mingw-w64-directxmath
pkgdesc="All inline SIMD C++ linear algebra library for use in games and graphics apps (mingw-w64)"
pkgver=dec2022
pkgrel=1
arch=('any')
makedepends=('mingw-w64-cmake')
url="https://go.microsoft.com/fwlink/?LinkID=615560"
license=('MIT')
options=('staticlibs' '!strip' '!buildflags')
source=(directxmath-${pkgver}.tar.gz::https://github.com/microsoft/DirectXMath/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('70a18f35343ff07084d31afa7a7978b3b59160f0533424365451c72475ff480f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    ${_arch}-cmake -S DirectXMath-$pkgver -B build/${_arch}
    cmake --build build/${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install build/${_arch}
  done
}
