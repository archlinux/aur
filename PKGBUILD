# Maintainer: Devin Lin <devin@kde.org>
pkgname=plasma-settings
pkgver=24.02.0
pkgrel=1
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
  'kirigami-addons'
)
makedepends=(cmake extra-cmake-modules)
source=("http://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('b5c7b5c58cba9250bffa0fb88f7cd3fb712bfc112fb1716ef9b1c07f0bd6d2ca')

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
