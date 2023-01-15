# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=maliit-framework
pkgver=2.3.0
pkgrel=1
pkgdesc='Core libraries of Maliit and server'
arch=(x86_64)
url='https://maliit.github.io/'
license=(LGPL)
depends=(qt5-declarative)
makedepends=(cmake qt5-wayland wayland-protocols gtk3 python)
optdepends=('qt5-wayland: wayland-shell integration')
source=(https://github.com/maliit/framework/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('bfc23919ac8b960243f85e8228ad7dfc28d557b52182a0b5a2a216a5c6a8057c')

build() {
  cmake -B build -S framework-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Denable-tests=OFF \
    -Denable-docs=OFF \
    -Denable-dbus-activation=ON \
    -DQT5_PLUGINS_INSTALL_DIR=lib/qt/plugins \
    -DQT5_MKSPECS_INSTALL_DIR=lib/qt/mkspecs
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
