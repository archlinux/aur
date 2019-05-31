pkgname=wlcs
pkgver=1.0.0
pkgrel=0
pkgdesc="Canonical's protocol-conformance-verifying test suite for Wayland compositor implementations."
url='https://github.com/MirServer/wlcs'
arch=(x86_64 i686)
license=(GPL)
depends=(gtest boost-libs wayland)
makedepends=(git cmake boost gmock wayland-protocols)
optdepends=()
source=("https://github.com/MirServer/wlcs/releases/download/v${pkgver}/wlcs-${pkgver}.tar.xz")
sha256sums=('8d88e029c5bac25d2995e916d5cc145006347f3541e5c1e1dc7c8f17ade8e1d4')

BUILD_DIR=build

build() {
  cd "${pkgname}-${pkgver}"
  mkdir -p "${BUILD_DIR}"
  cd "${BUILD_DIR}"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_LIBDIR="lib/" ..
  cmake --build ./
}

package() {
  cd "${pkgname}-${pkgver}/${BUILD_DIR}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et: