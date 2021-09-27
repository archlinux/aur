# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-gui
pkgver=5.2.0
pkgrel=1
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-gui/archive/${pkgname}5_${pkgver}.tar.gz")
sha256sums=('2753ed861ffca3c3a522ec2baefa025da85f65f48ea7684e18ad26c417d51fb7')

_dir="ign-gui-${pkgname}5_${pkgver}"

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
