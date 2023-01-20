# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-gui
pkgver=7.0.0
pkgrel=1
pkgdesc="Builds on top of Qt to provide widgets which are useful when developing
robotics applications, such as a 3D view, plots, dashboard, etc, and can be used
together in a convenient unified interface."
arch=('x86_64')
url="https://gazebosim.org/libs/gui"
license=('Apache')
depends=(
    eigen
    qt5-base
    qt5-quickcontrols2
    protobuf
    tinyxml2
    ignition-math
    ignition-common
    ignition-plugin
    ignition-transport
    ignition-rendering
    ignition-msgs
    ignition-tools
)
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-gui/archive/gz-gui7_${pkgver}.tar.gz")
sha256sums=('ba70e06e9ba4cd0f79ecf77d2ac9cd2ae2bec24d6f6a131f8db939cafe4987f3')

_dir="gz-gui-gz-gui7_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING=OFF

  make
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="${pkgdir}/" install
}
