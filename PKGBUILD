# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-night-light
pkgver=6.7.5
pkgrel=1
pkgdesc='Helpers for scheduling the dark-light cycle'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-night-light'
license=(LGPL-2.0-or-later)
depends=(glibc
         kconfig
         kdbusaddons
         kholidays
         libstdc++
         qt6-base
         qt6-positioning
         sonic-frameworks-core-addons)
makedepends=(ki18n
             qt6-tools
             sonic-frameworks-cmake-modules)
provides=(knighttime)
conflicts=(knighttime)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f64c3713183412f32337c1d7510192d6ad220962d0c75a6ad6fa21a17cb41880')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
