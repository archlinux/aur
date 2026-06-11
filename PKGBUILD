# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-auth
pkgver=6.26.0
pkgrel=1
pkgdesc='Abstraction to system policy and authentication features'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-auth'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(glibc
         libstdc++
         polkit-qt6
         qt6-base
         sonic-frameworks-core-addons
         sonic-frameworks-windowsystem)
makedepends=(doxygen
             qt6-tools
             sonic-frameworks-cmake-modules)
provides=(kauth)
conflicts=(kauth)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3db9cd8091f7855a4b65332fdbb7adf7c6cfe17416ecf91443db2720fb94bd1a')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
