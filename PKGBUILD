# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
pkgname=ignition-fuel_tools
pkgver=8.0.1
pkgrel=1
pkgdesc="A client library and command line tools for interacting with Gazebo Fuel servers."
arch=('i686' 'x86_64')
url="https://gazebosim.org/libs/fuel_tools"
license=('Apache')
groups=('development')
depends=('curl' 'jsoncpp' 'libyaml' 'libzip' 'ignition-common'
         'ignition-msgs' 'ignition-tools')
makedepends=('ignition-cmake')
optdepends=('ruby')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-fuel-tools/archive/gz-fuel-tools8_${pkgver}.tar.gz")
sha256sums=('7e42654acd2b5cb1f4d5cea34cf14d98117afb9505f4d7eacdbbb20e8c97cb80')

_dir="gz-fuel-tools-gz-fuel-tools8_${pkgver}"

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
