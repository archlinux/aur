# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-runner
pkgver=6.28.0
pkgrel=1
pkgdesc='Framework for providing different actions given a string query'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-runner'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(glibc
         kconfig
         ki18n
         kitemmodels
         libstdc++
         qt6-base
         sonic-frameworks-core-addons
         sonic-frameworks-windowsystem)
makedepends=(doxygen
             qt6-tools
             sonic-frameworks-cmake-modules
             sonic-frameworks-doctools)
provides=(krunner)
conflicts=(krunner)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('075803b0645516069ca6842bf13d4b7509c74a12a6634bbc38482bc599681cd9')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
