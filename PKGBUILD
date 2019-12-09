pkgname=wlcs
pkgver=1.1.0
_tardirname=1.0.0
pkgrel=1
pkgdesc="Canonical's protocol-conformance-verifying test suite for Wayland compositor implementations."
url='https://github.com/MirServer/wlcs'
arch=(x86_64 i686)
license=(GPL)
depends=(gtest boost-libs wayland)
makedepends=(git cmake boost gmock wayland-protocols)
optdepends=()
source=("https://github.com/MirServer/wlcs/releases/download/v${pkgver}/wlcs-${pkgver}.tar.xz")
sha256sums=('7238dd4a0fece16b7eb21db90722795fb68f20e0fcfc82ab01bce5b63ca415d1')

BUILD_DIR=build

build() {
  cd "${pkgname}-${_tardirname}"
  mkdir -p "${BUILD_DIR}"
  cd "${BUILD_DIR}"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_LIBDIR="lib/" ..
  cmake --build ./
}

package() {
  cd "${pkgname}-${_tardirname}/${BUILD_DIR}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
