pkgname=ignition-math-4
pkgver=4.0.0
pkgrel=4
pkgdesc="Math classes and functions for robot applications"
arch=('i686' 'x86_64')
url="https://ignitionrobotics.org/libs/math"
license=('Apache')
groups=('development')
depends=('gcc-libs')
makedepends=('ignition-cmake=0')
optdepends=()
provides=('ignition-math=4')
_name="ignition-math4"
source=("https://bitbucket.org/osrf-migrated/ign-math/get/${_name}_${pkgver}.tar.bz2")
sha256sums=('b671098ddbd1c1971c1f14c5a0eccc25767e07a2b15dcef043be3e24a9c2d499')

_dir="osrf-migrated-ign-math-054f8a99081f"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  # Configure build
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING:BOOL=False

  # Compile
  make
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
