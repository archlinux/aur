# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-gui
pkgver=4.1.0
pkgrel=3
pkgdesc="Builds on top of Qt to provide widgets which are useful when developing
robotics applications, such as a 3D view, plots, dashboard, etc, and can be used
together in a convenient unified interface."
arch=('x86_64')
url="https://ignitionrobotics.org/libs/gui"
license=('Apache')
depends=(
	qt5-base
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-gui/archive/${pkgname}4_${pkgver}.tar.gz")
sha256sums=('9811710faa0ff07c134f07f82cbc0020dcc44c62c4feb087250e25bece252a7b')

_dir="ign-gui-${pkgname}4_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  # Configure build
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING=OFF

  # Compile
  make
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="${pkgdir}/" install
}
