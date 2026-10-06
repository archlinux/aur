# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-auth
pkgver=6.30.0
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
sha256sums=('76070e68d857666ebf1c353eab52d06d0b6489ae9b0ca063595782f1653e05bb')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
