# Maintainer: Devin Lin <devin@kde.org>
pkgname=plasma-settings
pkgver=25.02.0
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
  'ki18n'
  'kirigami-addons'
  'kitemviews'
  'kservice'
  'kitemmodels'
)
makedepends=(cmake extra-cmake-modules)
source=("http://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('c72a0e847fba06e248d66c1c9bc4432dc94b195f6eab693aa1183970bc6bf363')

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
