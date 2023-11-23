# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-physics
pkgver=7.0.0
pkgrel=1
pkgdesc="Abstract physics interface designed to support simulation and rapid
development of robot applications."
arch=('x86_64')
url="https://gazebosim.org/libs/physics"
license=('Apache')
depends=('ignition-cmake>2' 'ignition-math>6' 'ignition-plugin'
         'ignition-common>3' 'libdart' 'sdformat>9')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-physics/archive/gz-physics7_${pkgver}.tar.gz")
sha256sums=('d352b68bec5d2e28cb20237d2cb68917e4acfe122e6df0dc059ed436d65fd270')

_dir="gz-physics-gz-physics7_${pkgver}"

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
