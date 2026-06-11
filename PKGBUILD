# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-gui-addons
pkgver=6.26.0
pkgrel=2
pkgdesc='Addons to QtGui'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-gui-addons'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(glibc
         libstdc++
         libx11
         qt6-base
         wayland)
makedepends=(doxygen
             plasma-wayland-protocols
             pyside6
             python-build
             python-setuptools
             qt6-declarative
             qt6-tools
             sonic-frameworks-cmake-modules
             wayland-protocols)
optdepends=('pyside6: Python bindings'
            'qt6-declarative: QML bindings')
provides=(kguiaddons)
conflicts=(kguiaddons)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4c40d016a57ad059fb243a27a45229a8fadc4da201e7abe5a881e6f638035260')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
