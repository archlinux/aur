# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
pkgname=ignition-common
pkgver=3.3.0
pkgrel=1
pkgdesc="A collection of useful classes and functions for handling many command tasks. This includes parsing 3D mesh files, managing console output, and using PID controllers."
arch=('any')
url="http://ignitionrobotics.org/libs/common"
license=('Apache')
groups=('development')
depends=('ignition-math>=6' 'tinyxml2' 'freeimage' 'libutil-linux' 'gts' 'ffmpeg')
makedepends=('ignition-cmake>=2' 'util-linux')
optdepends=()
conflicts=()
source=("https://bitbucket.org/ignitionrobotics/ign-common/get/${pkgname}3_${pkgver}.tar.bz2")
sha256sums=('39c0404a88f8fa6d0c1a80b35513696452779371aab7d42549058da1f37a650a')

_dir="ignitionrobotics-ign-common-818bcd7029c8"

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

#check() {
#  cd "$srcdir/$_dir/build"
#
#  cmake .. -DCMAKE_BUILD_TYPE="Release" \
#           -DCMAKE_INSTALL_PREFIX="/usr" \
#           -DCMAKE_INSTALL_LIBDIR="lib" \
#           -DBUILD_TESTING:BOOL=True
#
#  make
#  make test
#}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
