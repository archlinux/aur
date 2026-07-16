# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-activities
pkgver=6.7.3
pkgrel=1
pkgdesc='Core components for SonicDE Activities'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-activities'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kconfig
         qt6-base
         sonic-frameworks-core-addons)
makedepends=(qt6-declarative
             qt6-tools
             sonic-frameworks-cmake-modules)
optdepends=('qt6-declarative: QML bindings')
provides=(plasma-activities)
conflicts=(kactivities plasma-activities)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e721849171c294afc9295ad2bdf85c192f0df34e15c564c432bcfcfd3118332f')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
