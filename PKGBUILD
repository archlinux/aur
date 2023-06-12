# Maintainer: thyTwilightGoth <https://aur.archlinux.org/account/thyTwilightGoth>
# Contributor: Pedro <https://aur.archlinux.org/account/PedroHLC>

_pkgname=wlcs
pkgname=$_pkgname
pkgver=1.5.0
pkgrel=1
pkgdesc="Canonical's protocol-conformance-verifying test suite for Wayland compositor implementations."
url='https://github.com/MirServer/wlcs'
arch=(x86_64 i686 aarch64)
license=(GPL)
depends=(gtest boost-libs wayland)
makedepends=(git cmake boost gmock wayland-protocols)
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2d05f62ccfbbd0c4300556e7713b086663678b2ee87fe8297cb7c81a482d23fa7948034da494f91609b954c11e350d4e52837217fbafeaba2a694de7828480b6')

BUILD_DIR=build

build() {
  cd "$pkgname-$pkgver"
  mkdir -p "${BUILD_DIR}"
  cd "${BUILD_DIR}"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_LIBDIR="lib/" ..
  cmake --build ./ -j$(($(nproc) / 2))
#  cmake --build ./
}

package() {
  cd "$pkgname-$pkgver/${BUILD_DIR}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
# cmake --build ./ -j$(($(nproc) / 2))
