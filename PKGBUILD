# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=ignition-fuel_tools-1
pkgver=1.2.0
pkgrel=2
pkgdesc="A C++ client library and command line tools for interacting with Ignition Fuel servers"
arch=('i686' 'x86_64')
url="http://ignitionrobotics.org/libs/fuel_tools"
license=('Apache')
groups=('development')
depends=('curl' 'jsoncpp' 'libyaml' 'libzip' 'ignition-common=1')
makedepends=('ignition-cmake=0')
optdepends=('ruby')
provides=('ignition-fuel_tools=1')
_name="ignition-fuel-tools1"
source=("https://bitbucket.org/ignitionrobotics/ign-fuel-tools/get/${_name}_${pkgver}.tar.bz2")
sha256sums=('6771f49d33637c1353720bcf619e8d3d7bd6b6d60aea6f3949aebcb47add9794')

_dir="ignitionrobotics-ign-fuel-tools-0ffbf3a2c836"

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
