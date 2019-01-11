# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
pkgname=ignition-fuel_tools
pkgver=1.2.0
pkgrel=1
pkgdesc="A C++ client library and command line tools for interacting with Ignition Fuel servers"
arch=('i686' 'x86_64')
url="http://ignitionrobotics.org/libs/fuel_tools"
license=('Apache')
groups=('development')
makedepends=('ignition-cmake')
depends=('curl' 'jsoncpp' 'libyaml' 'libzip' 'ignition-common')
optdepends=('ruby')
conflicts=()
source=("https://bitbucket.org/ignitionrobotics/ign-fuel-tools/get/ignition-fuel-tools1_${pkgver}.tar.bz2")
sha256sums=('SKIP')

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

# check() {
#   cd "$srcdir/$_dir/build"

#   cmake .. -DCMAKE_BUILD_TYPE="Release" \
#            -DCMAKE_INSTALL_PREFIX="/usr" \
#            -DCMAKE_INSTALL_LIBDIR="lib" \
#            -DBUILD_TESTING:BOOL=True

#   make
#   make test
# }

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
