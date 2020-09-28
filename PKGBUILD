pkgname=ignition-fuel_tools-1
pkgver=1.2.0
pkgrel=5
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
source=("https://github.com/ignitionrobotics/ign-fuel-tools/archive/ignition-fuel-tools1_${pkgver}.tar.gz")
sha256sums=('8c91ee29a24ad968143309297c73955e0a1e235bafd25d28179fcf83b7b70c7e')

_dir="ign-fuel-tools-ignition-fuel-tools1_${pkgver}"

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
