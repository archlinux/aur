# Maintainer: RXMLP <rxmlp-aur@use.startmail.com>

pkgname=hyprsessionmanager-git
pkgver=0.2
pkgrel=1
OPTIONS=-debug
pkgdesc="Session manager for Hyprland with Qt6 GUI"
arch=('x86_64')
url="https://github.com/rxmlp/hyprsessionmanager"
license=('0BSD')
depends=('qt6-base' 'hyprland' 'jq')
makedepends=('cmake' 'qt6-tools' 'gcc' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rxmlp/hyprsessionmanager/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('42aa24373ba45421ed11806cf370cc3b8d6e759468c758b9b6349a0c69fe8998')

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
  install -Dm644 ../hyprsessionmanager.desktop "$pkgdir/usr/share/applications/hyprsessionmanager.desktop"
  install -Dm644 ../logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/hyprsessionmanager.svg"
}
