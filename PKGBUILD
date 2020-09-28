pkgname=ignition-common-1
pkgver=1.1.1
pkgrel=5
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
source=("https://github.com/ignitionrobotics/ign-common/archive/ignition-common_${pkgver}.tar.gz")
sha256sums=('2e561f6c5d39622917171016f95302d0e2dfbdbc2c3c994a52a60949f3ed7ba3')

_dir="ign-common-ignition-common_${pkgver}"

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
