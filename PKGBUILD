# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma-camera-git
pkgver=r399.0782ac3
pkgrel=2
pkgdesc="Camera application for Plasma Mobile"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/plasma-camera"
license=('GPL-3.0-or-later')
conflicts=('plasma-camera')
provides=('plasma-camera')
depends=('ki18n' 'kconfig' 'kcoreaddons' 'knotifications' 'kirigami')
makedepends=('qt6-tools' 'qt6-svg' 'extra-cmake-modules' 'git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -B build -S "${pkgname%-git}"
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
}
