# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
pkgname=ignition-fuel_tools
pkgver=6.0.0
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-fuel-tools/archive/${pkgname//_/-}6_${pkgver}.tar.gz")
sha256sums=('7be5f00cab43127109b598e01ebe76f173e259e3ff4df2e1c220def19a9de9be')

_dir="ign-fuel-tools-${pkgname//_/-}6_${pkgver}"

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
