# Maintainer: Nxxx <nx dot tardis at gmail dot com>

pkgname=ignition-fuel_tools-4
pkgver=4.2.1
pkgrel=1
pkgdesc="A C++ client library and command line tools for interacting with Ignition Fuel servers"
arch=('i686' 'x86_64')
url="https://ignitionrobotics.org/libs/fuel_tools"
license=('Apache')
groups=('development')
depends=('curl' 'jsoncpp' 'libyaml' 'libzip' 'ignition-common>=3'
         'ignition-msgs-5' 'ignition-tools')
makedepends=('ignition-cmake>=2')
optdepends=('ruby')
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-fuel-tools/archive/ignition-fuel-tools4_${pkgver}.tar.gz")
sha256sums=('447ee273d6c51577635ee9717d8e13d00273ee54d6d734d740510b129aa550df')

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
