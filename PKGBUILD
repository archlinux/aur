pkgname=ignition-common-1
pkgver=1.1.1
pkgrel=4
pkgdesc="A collection of useful classes and functions for handling many command tasks. This includes parsing 3D mesh files, managing console output, and using PID controllers."
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://ignitionrobotics.org/libs/common"
license=('Apache')
groups=('development')
depends=('ignition-math=4' 'tinyxml2' 'freeimage' 'libutil-linux' 'gts' 'ffmpeg')
makedepends=('ignition-cmake=0' 'util-linux')
optdepends=()
provides=('ignition-common=1')
_name="ignition-common"
source=("https://bitbucket.org/osrf-migrated/ign-common/get/${_name}_${pkgver}.tar.bz2")
sha256sums=('49d3afe2b0f84b4b1fc8c1de8961d889a348688a129f078dc14176d2fc1c902b')

_dir="osrf-migrated-ign-common-4d7ed1df80b0"

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
