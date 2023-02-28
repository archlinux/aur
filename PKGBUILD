# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-gazebo
pkgver=7.4.0
pkgrel=1
pkgdesc="Open source robotics simulator. The latest version of Gazebo."
arch=('x86_64')
url="https://gazebosim.org/libs/gazebo"
license=('Apache')
depends=('benchmark' 'gflags' 'tinyxml2' 'tinyxml' 'eigen' 'qt5-declarative'
         'ignition-cmake' 'ignition-common' 'ignition-math'
         'ignition-plugin' 'ignition-physics' 'ignition-rendering'
         'ignition-tools' 'ignition-transport' 'ignition-gui' 'ignition-msgs'
         'sdformat' 'ignition-fuel_tools' 'ignition-sensors')
makedepends=('cmake' 'ruby-ronn' 'doxygen')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-sim/archive/gz-sim7_${pkgver}.tar.gz")
sha256sums=('f8707038bc692f5157e3ff6852f83f876f5939697aafd0393747ee171479fd29')

_dir="gz-sim-gz-sim7_${pkgver}"

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
