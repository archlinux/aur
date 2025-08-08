# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=komodo
pkgver=1.0.0
pkgrel=2
pkgdesc='Kirigami-based todo manager'
arch=('x86_64')
url='https://invent.kde.org/utilities/komodo'
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
depends=(
  gcc-libs
  glibc
  kcolorscheme
  kconfig
  kcoreaddons
  kdbusaddons
  kguiaddons
  ki18n
  kiconthemes
  kirigami
  kirigami-addons
  kitemmodels
  qqc2-desktop-style
  qt6-base
  qt6-declarative
)
makedepends=(
  extra-cmake-modules
  reuse
  vulkan-headers
)
source=(https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('0831ac4a43ea292653105541e1db2d98346e94f3eb2aae5a365375de798377bc'
            'SKIP')
validpgpkeys=(6CF8BBBD93FD0A4A748495A12D8ADFDD01E76FAC) # Akseli Lahtinen <akselmo@akselmo.dev>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
