# Maintainer: Nxxx <nx dot tardis at gmail dot com>

pkgname=ignition-fuel_tools-4
pkgver=4.4.0
pkgrel=1
pkgdesc="A C++ client library and command line tools for interacting with Ignition Fuel servers"
arch=('i686' 'x86_64')
url="https://ignitionrobotics.org/libs/fuel_tools"
license=('Apache')
groups=('development')
depends=('curl' 'jsoncpp' 'libyaml' 'libzip' 'ignition-common-3'
         'ignition-msgs-5' 'ignition-tools')
makedepends=('ignition-cmake>=2')
optdepends=('ruby')
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-fuel-tools/archive/ignition-fuel-tools4_${pkgver}.tar.gz")
sha256sums=('aa888518a650ef68ce8c37d97f53c63861295e3b210a68b4be514a727b5ba228')

_dir="ign-fuel-tools-ignition-fuel-tools4_${pkgver}"

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
