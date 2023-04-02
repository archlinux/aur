# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-physics
pkgver=6.3.0
pkgrel=2
pkgdesc="Abstract physics interface designed to support simulation and rapid
development of robot applications."
arch=('x86_64')
url="https://gazebosim.org/libs/physics"
license=('Apache')
depends=('ignition-cmake>2' 'ignition-math>6' 'ignition-plugin'
         'ignition-common>3' 'libdart' 'sdformat>9')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-physics/archive/gz-physics6_${pkgver}.tar.gz")
sha256sums=('30be46667ab4db00de64580019ab4f27c0cd0e517b463750188e07f2e89c7fa9')

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
