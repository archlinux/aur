# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-gui-addons
pkgver=6.27.0
pkgrel=1
pkgdesc='Addons to QtGui'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-gui-addons'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(glibc
         libstdc++
         libx11
         qt6-base)
makedepends=(doxygen
             pyside6
             python-build
             python-setuptools
             qt6-declarative
             qt6-tools
             sonic-frameworks-cmake-modules)
optdepends=('pyside6: Python bindings'
            'qt6-declarative: QML bindings')
provides=(kguiaddons)
conflicts=(kguiaddons)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5d463f4d99958ba93a48faeb2ad4d69ef593ce2c139154a42597af9a7766b7b0')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
