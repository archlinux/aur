# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=ignition-common-1
pkgver=1.1.1
pkgrel=1
pkgdesc="A collection of useful classes and functions for handling many command tasks. This includes parsing 3D mesh files, managing console output, and using PID controllers."
arch=('any')
url="http://ignitionrobotics.org/libs/common"
license=('Apache')
groups=('development')
depends=('ignition-math=4' 'tinyxml2' 'freeimage' 'libutil-linux' 'gts' 'ffmpeg')
makedepends=('ignition-cmake=0' 'util-linux')
optdepends=()
provides=('ignition-common=1')
_name="ignition-common"
source=("https://bitbucket.org/ignitionrobotics/ign-common/get/${_name}_${pkgver}.tar.bz2")
sha256sums=('5f9e65867b9a7b6df61ae68cf492f5ce894c4d9821097bcf65531b80185aac7c')

_dir="ignitionrobotics-ign-common-4d7ed1df80b0"

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
  make -j4
}

check() {
  cd "$srcdir/$_dir/build"

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING:BOOL=True

  make -j4
  make test
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
