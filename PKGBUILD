# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-windowsystem
pkgver=6.28.0
pkgrel=1
pkgdesc='Access to the windowing system'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-windowsystem'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(glibc
         libstdc++
         libx11
         libxcb
         libxfixes
         qt6-base
         xcb-util-keysyms)
makedepends=(doxygen
             qt6-declarative
             qt6-tools
             sonic-frameworks-cmake-modules)
optdepends=('qt6-declarative: QML bindings')
provides=(kwindowsystem)
conflicts=(kwindowsystem)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2bf3df481df6f3e2ed30c93dd1445faa7a056fc3e582297d38ddf8e7af5be288')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
