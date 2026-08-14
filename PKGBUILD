pkgname=mingw-w64-coacd
pkgver=1.0.12
pkgrel=1
pkgdesc="Approximate Convex Decomposition for 3D Meshes (mingw-w64)"
license=('MIT')
arch=(any)
url="https://colin97.github.io/CoACD/"
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake mingw-w64-cdt)
options=('staticlibs' '!buildflags' '!strip')
source=("https://github.com/SarahWeiii/CoACD/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9357bd6da525127ce538f6f0a3996e33573089848449bd70a2ae0c9bb82966c6')

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

