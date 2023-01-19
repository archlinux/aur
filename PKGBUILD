# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-physics
pkgver=6.2.0
pkgrel=1
pkgdesc="Abstract physics interface designed to support simulation and rapid
development of robot applications."
arch=('x86_64')
url="https://gazebosim.org/libs/physics"
license=('Apache')
depends=('ignition-cmake' 'ignition-math' 'ignition-plugin' 'ignition-common'
         'libdart' 'sdformat')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-physics/archive/gz-physics6_${pkgver}.tar.gz")
sha256sums=('b182071624fd13aa2cff6ca4d5c8afaaf2abaca19f664a8db22deac1e57b3ee2')

_dir="gz-physics-gz-physics6_${pkgver}"

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
