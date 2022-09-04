# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
pkgname=ignition-fuel_tools
pkgver=7.1.0
pkgrel=1
pkgdesc="A C++ client library and command line tools for interacting with Ignition Fuel servers"
arch=('i686' 'x86_64')
url="https://gazebosim.org/libs/fuel_tools"
license=('Apache')
groups=('development')
depends=('curl' 'jsoncpp' 'libyaml' 'libzip' 'ignition-common'
         'ignition-msgs' 'ignition-tools')
makedepends=('ignition-cmake')
optdepends=('ruby')
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-fuel-tools/archive/${pkgname//_/-}7_${pkgver}.tar.gz")
sha256sums=('45bc8a6fa61da8ec8e75f488a91c433ec3db0276815bdbfc7db47ee659bd59e9')

_dir="gz-fuel-tools-${pkgname//_/-}7_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  cmake .. -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING:BOOL=False

  make
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
