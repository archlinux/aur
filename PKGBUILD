pkgname=ignition-fuel_tools-1
pkgver=1.2.0
pkgrel=4
pkgdesc="A C++ client library and command line tools for interacting with Ignition Fuel servers"
arch=('i686' 'x86_64')
url="https://ignitionrobotics.org/libs/fuel_tools"
license=('Apache')
groups=('development')
depends=('curl' 'jsoncpp' 'libyaml' 'libzip' 'ignition-common=1')
makedepends=('ignition-cmake=0')
optdepends=('ruby')
provides=('ignition-fuel_tools=1')
_name="ignition-fuel-tools1"
source=("https://bitbucket.org/osrf-migrated/ign-fuel-tools/get/${_name}_${pkgver}.tar.bz2")
sha256sums=('daca2ecdb180b6b78a55286bcd3d498b35813f80a1ed34bfaa02d7c47caa93e7')

_dir="osrf-migrated-ign-fuel-tools-0ffbf3a2c836"

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
