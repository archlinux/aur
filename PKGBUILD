# Maintainer: Devin Lin <devin@kde.org>
pkgname=plasma-settings
pkgver=22.04
pkgrel=0
pkgdesc="Settings application for Plasma Mobile"
arch=(x86_64 i686 i486 pentium4 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/plasma-settings"
license=('GPL3')
groups=()
depends=(
  'kcmutils'
  'plasma-workspace'
  'kdeclarative'
  'plasma-framework'
  'ki18n'
  'modemmanager-qt'
  'networkmanager-qt'
  'powerdevil'
)
makedepends=(cmake extra-cmake-modules)
source=("https://download.kde.org/stable/plasma-mobile/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('deee20b21f597ba0feade1991340a3243c2cc6791386acb20e32de19e3ae80cc')

prepare() {
  mkdir -p build
}

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
