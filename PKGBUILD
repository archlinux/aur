pkgname=mingw-w64-coacd
pkgver=1.0.14
pkgrel=1
pkgdesc="Approximate Convex Decomposition for 3D Meshes (mingw-w64)"
license=('MIT')
arch=(any)
url="https://colin97.github.io/CoACD/"
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake mingw-w64-cdt)
options=('staticlibs' '!buildflags' '!strip')
source=("https://github.com/SarahWeiii/CoACD/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7a5d898c55a48668b19592a3bb8c5e3eb103836cda6883ca8955dfdce056d322')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

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

