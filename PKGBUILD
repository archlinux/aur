# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-gazebo
pkgver=4.0.0
pkgrel=1
pkgdesc="Open source robotics simulator."
arch=('x86_64')
url="https://ignitionrobotics.org/libs/gazebo"
license=('Apache')
depends=('benchmark' 'gflags' 'tinyxml2' 'tinyxml' 'eigen' 'qt5-declarative'
         'ignition-cmake' 'ignition-common' 'ignition-math'
         'ignition-plugin' 'ignition-physics' 'ignition-rendering'
         'ignition-tools' 'ignition-transport' 'ignition-gui' 'ignition-msgs'
         'sdformat')
makedepends=('cmake' 'ruby-ronn' 'doxygen')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-gazebo/archive/${pkgname}4_${pkgver}.tar.gz")
sha256sums=('963d169ec802d37a5409bb17e21d0b9079b7996a178da533490e889beb53b010')

_dir="ign-gazebo-${pkgname}4_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  # Configure build
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING=OFF

  # Compile
  make
}

package() {
  cd "$srcdir/$_dir/build"
  #make DESTDIR="$pkgdir/" install
  make install
}
