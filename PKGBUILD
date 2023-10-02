# Maintainer: Robert Manner <the_manni at users.sf.net>
# The recipe is from manjaro with minor changes. Thanks for the original work!

pkgname=osmin
pkgver=1.9.7
pkgrel=2
pkgdesc="Satellite Navigator & Tracker On-Road/Off-Road for Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/janbar/osmin"
license=('GPL3')
depends=('openmp' 'qt5-graphicaleffects' 'qt5-location' 'qt5-multimedia' 'qt5-quickcontrols2' 'qt5-sensors' 'qt5-svg' 'qt5-wayland' 'qt5-remoteobjects')
makedepends=('clang' 'cmake' 'double-conversion' 'git' 'glib2' 'md4c' 'tslib' 'xcb-util-image' 'xcb-util-keysyms' 'xdg-utils')
source=( "git+https://github.com/janbar/osmin.git")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  git checkout "$pkgver"
  git submodule init
  git submodule update
  mkdir -p build
}

build() {
  cd "$pkgname"
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_DEVICE_MOBILE=ON \
    -DCMAKE_C_COMPILER=/usr/bin/clang \
    -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
    -DCMAKE_BUILD_TYPE=Release . 
  cmake --build build/
}

package() {
  cd "$pkgname/build"
  make DESTDIR="$pkgdir/" install
}
