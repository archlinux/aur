# Maintainer: RXMLP <rxmlp-aur@use.startmail.com>

pkgname=hyprsessionmanager-git
pkgver=0.1
pkgrel=1
OPTIONS=-debug
pkgdesc="Session manager for Hyprland with Qt6 GUI"
arch=('x86_64')
url="https://github.com/rxmlp/hyprsessionmanager"
license=('0BSD')
depends=('qt6-base' 'hyprland' 'jq')
makedepends=('cmake' 'qt6-tools' 'gcc' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rxmlp/hyprsessionmanager/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9efe8d68eb984a42fd33bcfa6bd5a6657607aa086da4ddac945701bc79bea1a9')

build() {
  cd "${srcdir}/hyprsessionmanager-${pkgver}"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/hyprsessionmanager-${pkgver}/build"
  install -Dm755 hyprsessionmanager "$pkgdir/usr/bin/hyprsessionmanager"
  install -Dm644 ../README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
