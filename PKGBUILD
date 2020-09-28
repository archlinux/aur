pkgname=ignition-math-4
pkgver=4.0.0
pkgrel=5
pkgdesc="Math classes and functions for robot applications"
arch=('i686' 'x86_64')
url="https://ignitionrobotics.org/libs/math"
license=('Apache')
groups=('development')
depends=('gcc-libs')
makedepends=('ignition-cmake=0')
optdepends=()
provides=('ignition-math=4')
source=("https://github.com/ignitionrobotics/ign-math/archive/ignition-math4_${pkgver}.tar.gz")
sha256sums=('e374fd5ada13200a8f1b7ba98865d6325688b248e68e540e2ace7a8d0904b001')

_dir="ign-math-ignition-math4_${pkgver}"

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
