# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-gazebo
pkgver=8.0.0
pkgrel=1
pkgdesc="Open source robotics simulator. The latest version of Gazebo."
arch=('x86_64')
url="https://gazebosim.org/libs/gazebo"
license=('Apache')
depends=('benchmark' 'gflags' 'tinyxml2' 'tinyxml' 'eigen' 'qt5-declarative'
         'ignition-cmake>2' 'ignition-common>3' 'ignition-math>6'
         'ignition-plugin' 'ignition-physics' 'ignition-rendering'
         'ignition-tools>1' 'ignition-transport>8' 'ignition-gui' 'ignition-msgs>5'
         'sdformat' 'ignition-fuel_tools>4' 'ignition-sensors')
makedepends=('cmake' 'ruby-ronn' 'doxygen')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-sim/archive/gz-sim8_${pkgver}.tar.gz")
sha256sums=('c6298a9d03b9a6e5badd1a78a3b178201e9efac2209bbc2fe5a6b6bbba85125c')

_dir="gz-sim-gz-sim8_${pkgver}"

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
