# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=maliit-framework
pkgver=2.3.0
pkgrel=2
pkgdesc='Core libraries of Maliit and server'
arch=(x86_64)
url='https://maliit.github.io/'
license=(LGPL-2.1-only)
depends=(gcc-libs
         glib2
         glibc
         libxcb
         qt5-base
         qt5-declarative
         systemd-libs
         wayland)
makedepends=(cmake
             git
             glib2-devel
             gtk3
             qt5-wayland 
             wayland-protocols)
optdepends=('qt5-wayland: wayland-shell integration')
source=(git+https://github.com/maliit/framework#tag=$pkgver)
sha256sums=('08f2a12d36fd1e0c4f838ae276f2dee8a31339f3ffa5d9a844bda8f82dc593e5')

build() {
  cmake -B build -S framework \
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
