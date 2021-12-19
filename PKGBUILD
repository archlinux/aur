# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-physics
pkgver=5.1.0
pkgrel=1
pkgdesc="Abstract physics interface designed to support simulation and rapid
development of robot applications."
arch=('x86_64')
url="https://ignitionrobotics.org/libs/physics"
license=('Apache')
depends=('ignition-cmake' 'ignition-math' 'ignition-plugin' 'ignition-common'
         'libdart' 'sdformat')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-physics/archive/${pkgname}5_${pkgver}.tar.gz")
sha256sums=('8b83eacaaf83196fd3a3ff164cb36a5859d434e359299ecf9259a6d4aebd7280')

_dir="ign-physics-${pkgname}5_${pkgver}"

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
