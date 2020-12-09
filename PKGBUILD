# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
pkgname=ignition-fuel_tools
pkgver=5.0.0
pkgrel=1
pkgdesc="A C++ client library and command line tools for interacting with Ignition Fuel servers"
arch=('i686' 'x86_64')
url="https://ignitionrobotics.org/libs/fuel_tools"
license=('Apache')
groups=('development')
depends=('curl' 'jsoncpp' 'libyaml' 'libzip' 'ignition-common>=3'
         'ignition-msgs>=5' 'ignition-tools')
makedepends=('ignition-cmake>=2')
optdepends=('ruby')
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-fuel-tools/archive/${pkgname//_/-}5_${pkgver}.tar.gz")
sha256sums=('76f7a592ac7572042abd37995a85812403aee7cd08385d28ed803790a9aeedd3')

_dir="ign-fuel-tools-${pkgname//_/-}5_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  # Configure build
  cmake .. -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING:BOOL=False

  # Compile
  make
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
