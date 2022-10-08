# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma-camera-git
pkgver=r228.790eca8
pkgrel=1
pkgdesc="Camera application for Plasma Mobile"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/plasma-camera"
license=('GPL3')
conflicts=('plasma-camera')
provides=('plasma-camera')
depends=('ki18n' 'kconfig' 'kcoreaddons' 'knotifications' 'kirigami2'
         'kdbusaddons' 'plasma-framework')
makedepends=('qt5-tools' 'qt5-svg' 'extra-cmake-modules')
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
