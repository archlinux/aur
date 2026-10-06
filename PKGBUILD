# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-activities-stats
pkgver=6.7.5
pkgrel=1
pkgdesc='A library for accessing the usage data collected by the activities system'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-activities-stats'
license=(LGPL-2.0-or-later)
depends=(glibc
         kconfig
         libstdc++
         qt6-base
         sonic-activities)
makedepends=(qt6-tools
             sonic-frameworks-cmake-modules)
conflicts=(kactivities-stats plasma-activities-stats)
replaces=(kactivities-stats)
provides=(plasma-activities-stats)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8b6182bcf845bb51a95371889f8f6a065685372ad8856bd48edad6012a76f094')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
