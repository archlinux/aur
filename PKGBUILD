# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=kwin-zones
pkgver=1.0.13
pkgrel=1
pkgdesc='Wayland ext-zones for KWin'
arch=(x86_64)
url='https://invent.kde.org/automotive/kwin-zones'
license=(GPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kconfig
         kwin
         qt6-base
         qt6-declarative
         wayland)
makedepends=(extra-cmake-modules
             vulkan-headers
             vulkan-icd-loader
             wayland-protocols)
source=(https://invent.kde.org/automotive/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha256sums=('44420e178f7387ac9f59c2e8366e5ea7894d140f94ea40b68ceda43d221f967e')

build() {
  cmake -B build -S $pkgname-v$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
