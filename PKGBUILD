# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=kwin-zones
pkgver=1.0.12
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
sha256sums=('eca1591c33d37a8fc97a4729ad4ec905055d2d8774feccbfe4078392ac1ae711')

build() {
  cmake -B build -S $pkgname-v$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
