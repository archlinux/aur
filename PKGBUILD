# Maintainer: Devin Lin <devin@kde.org>
pkgname=plasma-settings
pkgver=22.09
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
  'modemmanager-qt'
  'networkmanager-qt'
  'powerdevil'
  'kirigami-addons'
)
makedepends=(cmake extra-cmake-modules)
source=("https://download.kde.org/stable/plasma-mobile/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('6a3aaf404c2c9f2fc98b376a4539069ddd4c793056121b4846ea883fd9c9024b')

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
