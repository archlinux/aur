# Maintainer: RXMLP <rxmlp-aur@use.startmail.com>

pkgname=hyprsessionmanager-git
pkgver=0.3
pkgrel=1
OPTIONS=-debug
pkgdesc="Session manager for Hyprland with Qt6 GUI"
arch=('x86_64')
url="https://codeberg.org/xyrd/hyprsessionmanager"
license=('0BSD')
depends=('qt6-base' 'hyprland' 'jq')
makedepends=('cmake' 'qt6-tools' 'gcc' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/xyrd/hyprsessionmanager/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6a607820be21cabae269d48f1472a58a596e5439a5f9eab86bfc3b56af7b06be')

build() {
  cd "${srcdir}/hyprsessionmanager"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/hyprsessionmanager/build"
  install -Dm755 hyprsessionmanager "$pkgdir/usr/bin/hyprsessionmanager"
  install -Dm644 ../hyprsessionmanager.desktop "$pkgdir/usr/share/applications/hyprsessionmanager.desktop"
  install -Dm644 ../logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/hyprsessionmanager.svg"
}
