# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-night-light
pkgver=6.7.4
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
sha256sums=('e29956d831e42fe72ce4051350ca490c9b84d8d962fb072fd8588e468ec5271b')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
