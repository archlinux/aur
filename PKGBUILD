# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-rendering
pkgver=6.1.0
pkgrel=2
pkgdesc="C++ library designed to provide an abstraction for different rendering
engines. It offers unified APIs for creating 3D graphics applications."
arch=('x86_64')
url="https://ignitionrobotics.org/libs/rendering"
license=('Apache')
depends=('ignition-common' 'ignition-math' 'ignition-plugin' 'ogre=1.9')
makedepends=('cmake' 'ignition-cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-rendering/archive/${pkgname}6_${pkgver}.tar.gz")
sha256sums=('ca39bd98777c87ad4010a70f915e46b78baaa74e64a43f0b6468819f1aa20f1e')

_dir="ign-rendering-${pkgname}6_${pkgver}"

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
  make DESTDIR="$pkgdir/" install
}
