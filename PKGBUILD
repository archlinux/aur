# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Maintainer: Nxxx <nx dot tardis at gmail dot com>

pkgname=ignition-fuel_tools-4
pkgver=4.8.0
pkgrel=1
pkgdesc="A client library and command line tools for interacting with Gazebo Fuel servers."
arch=('i686' 'x86_64')
url="https://gazebosim.org/libs/fuel_tools"
license=('Apache')
groups=('development')
depends=('curl' 'jsoncpp' 'libyaml' 'libzip' 'ignition-common=3'
         'ignition-msgs=5' 'ignition-tools')
makedepends=('ignition-cmake=2')
optdepends=('ruby')
provides=('ignition-fuel_tools=4')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-fuel-tools/archive/ignition-fuel-tools4_${pkgver}.tar.gz")
sha256sums=('bffd5bbfad8d4802f563412642c584600b9d8a6f0aa59aa9d876110a76f76e86')

_dir="gz-fuel-tools-ignition-fuel-tools4_${pkgver}"

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
