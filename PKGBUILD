# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Mykola Dolhyi <0xb000@gmail.com>
pkgname=ignition-math
pkgver=6.4.0
pkgrel=2
pkgdesc="Math classes and functions for robot applications"
arch=('i686' 'x86_64')
url="http://ignitionrobotics.org/"
license=('Apache')
groups=('development')
depends=('gcc-libs')
makedepends=('ignition-cmake>=2' 'ruby<=2.7' 'ruby>=2.6')
optdepends=('eigen')
conflicts=()
source=("https://bitbucket.org/ignitionrobotics/ign-math/get/${pkgname}6_${pkgver}.tar.bz2")
sha256sums=('5463d2ee5202ad60965a613361c1b12e34d3a8c49ad9037b16120f89b0250745')

_dir="ignitionrobotics-ign-math-11bba67b3176"

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
