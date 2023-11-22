# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: AchmadFathoni <fathoni DOT id AT gmail DOT com>
# Contributor: Mykola Dolhyi <0xb000@gmail.com>
# Contributor: Ramdambo <https://github.com/Ramdambo>
pkgname=ignition-math
pkgver=7.3.0
pkgrel=3
pkgdesc="General purpose math library for robot applications."
arch=('i686' 'x86_64')
url="https://gazebosim.org/libs/math"
license=('Apache')
groups=('development')
depends=('gcc-libs' 'swig')
makedepends=('ignition-cmake>2' 'ignition-utils>1' 'eigen' 'python' 'pybind11')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-math/archive/gz-math7_${pkgver}.tar.gz")
sha256sums=("320afb30f43727340718743c0f8d94e61e9c1083c17927701efe75087f9cc6d0")

_dir="gz-math-gz-math7_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  cmake .. -Wno-dev \
           -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING:BOOL=False

  make
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
