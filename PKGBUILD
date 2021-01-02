# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-gazebo
pkgver=4.1.0
pkgrel=6
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-gazebo/archive/${pkgname}4_${pkgver}.tar.gz"
        "qttextureptr.patch::https://patch-diff.githubusercontent.com/raw/ignitionrobotics/ign-gazebo/pull/527.patch")
sha256sums=('31f85b3b14be31a492d138be59490d868eb5794b3049b9b9c8324e75e8648424'
            'SKIP')

_dir="ign-gazebo-${pkgname}4_${pkgver}"

prepare() {
  cd "$srcdir/$_dir"
  patch --forward --strip=1 --input="${srcdir}/qttextureptr.patch"
}

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
