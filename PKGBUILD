# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-gazebo
pkgver=6.3.0
pkgrel=1
pkgdesc="Open source robotics simulator."
arch=('x86_64')
url="https://ignitionrobotics.org/libs/gazebo"
license=('Apache')
depends=('benchmark' 'gflags' 'tinyxml2' 'tinyxml' 'eigen' 'qt5-declarative'
         'ignition-cmake' 'ignition-common' 'ignition-math'
         'ignition-plugin' 'ignition-physics' 'ignition-rendering'
         'ignition-tools' 'ignition-transport' 'ignition-gui' 'ignition-msgs'
         'sdformat' 'ignition-fuel_tools' 'ignition-sensors')
makedepends=('cmake' 'ruby-ronn' 'doxygen')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-gazebo/archive/${pkgname}6_${pkgver}.tar.gz")
sha256sums=('17d16e7f43a67f050f5f94b3aeca04626c843c2351fb6928a187cf85f0afb7c8')

_dir="ign-gazebo-${pkgname}6_${pkgver}"

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
