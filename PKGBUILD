# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-gazebo
pkgver=6.4.0
pkgrel=2
pkgdesc="Open source robotics simulator."
arch=('x86_64')
url="https://gazebosim.org/libs/gazebo"
license=('Apache')
depends=('benchmark' 'gflags' 'tinyxml2' 'tinyxml' 'eigen' 'qt5-declarative'
         'ignition-cmake' 'ignition-common' 'ignition-math'
         'ignition-plugin' 'ignition-physics' 'ignition-rendering'
         'ignition-tools' 'ignition-transport' 'ignition-gui' 'ignition-msgs'
         'sdformat' 'ignition-fuel_tools' 'ignition-sensors')
makedepends=('cmake' 'ruby-ronn' 'doxygen')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-gazebo/archive/${pkgname}6_${pkgver}.tar.gz")
sha256sums=('97b628d6ae92fc2cc7013e45ec593ce0841524609d6111d4bb95c39e967b6d8e')

_dir="gz-sim-${pkgname}6_${pkgver}"

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
