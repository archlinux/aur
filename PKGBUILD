pkgname=mingw-w64-coacd
pkgver=1.0.10
pkgrel=1
pkgdesc="Approximate Convex Decomposition for 3D Meshes (mingw-w64)"
license=('MIT')
arch=(any)
url="https://colin97.github.io/CoACD/"
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake mingw-w64-cdt)
options=('staticlibs' '!buildflags' '!strip')
source=("https://github.com/SarahWeiii/CoACD/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e43873d3ebe647cb720ce28d5167c888ff5401c4c8c38666bee25cf7f04abe40')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd CoACD-$pkgver
}

build() {
  cd CoACD-$pkgver
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DWITH_3RD_PARTY_LIBS=OFF -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd CoACD-$pkgver
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
  done
}

