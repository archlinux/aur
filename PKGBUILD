# Maintainer: Nxxx <nx dot tardis at gmail dot com>

pkgname=ignition-fuel_tools-4
pkgver=4.4.0
pkgrel=1
pkgdesc="A C++ client library and command line tools for interacting with Ignition Fuel servers"
arch=('i686' 'x86_64')
url="https://gazebosim.org/libs/fuel_tools"
license=('Apache')
groups=('development')
depends=('curl' 'jsoncpp' 'libyaml' 'libzip' 'ignition-common-3'
         'ignition-msgs-5' 'ignition-tools')
makedepends=('ignition-cmake>=2')
optdepends=('ruby')
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-fuel-tools/archive/ignition-fuel-tools4_${pkgver}.tar.gz")
sha256sums=('ad218743ac35cc71f5324a13a34959c596c1d6e5c25da52870fcbab02432939d')

_dir="gz-fuel-tools-ignition-fuel-tools4_${pkgver}"

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
