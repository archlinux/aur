# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
pkgname=ignition-common
pkgver=3.5.0
pkgrel=1
pkgdesc="A collection of useful classes and functions for handling many command tasks. This includes parsing 3D mesh files, managing console output, and using PID controllers."
arch=('any')
url="https://ignitionrobotics.org/libs/common"
license=('Apache')
groups=('development')
depends=('ignition-math>=6' 'tinyxml2' 'freeimage' 'libutil-linux' 'gts' 'ffmpeg')
makedepends=('ignition-cmake>=2' 'util-linux')
optdepends=()
conflicts=()
source=("https://github.com/ignitionrobotics/ign-common/archive/${pkgname}3_${pkgver}.tar.gz")
sha256sums=('e0ad7a75bd0ed5dba4e3e041941f35ccf805ac05d9370dcacde2b92819c4730c')

_dir="ign-common-${pkgname}3_${pkgver}"

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
