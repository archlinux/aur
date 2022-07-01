# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-gazebo
pkgver=6.10.0
pkgrel=1
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-sim/archive/${pkgname}6_${pkgver}.tar.gz")
sha256sums=('f5538848cd89711912853ab99faa0c46ee6a4b47c17a8aa06c9814a879d4c8b8')

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
