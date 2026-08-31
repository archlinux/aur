# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-activities-stats
pkgver=6.7.4
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
sha256sums=('fcb256dadee19878113a7778e72f799eafd3fe62e99a72ae7abe07bf3e285356')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
