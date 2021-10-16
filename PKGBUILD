# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
# Contributor: marauder <abhinav.kssk@gmail.com>
pkgname=ignition-tools
pkgver=1.2.0
pkgrel=1
pkgdesc="Ignition tools provide the ign command line tool that accepts multiple subcommands."
arch=('any')
url="https://github.com/ignitionrobotics/ign-tools"
license=('Apache')
groups=('development')
makedepends=('cmake' 'doxygen' 'pkg-config' 'ruby-ronn')
depends=('ruby')
optdepends=()
conflicts=()
source=("https://github.com/ignitionrobotics/ign-tools/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('fe6dfb5bfca51b0c7fdfc1aec1550102b4ee55b84e9b6b9f86e119ac9c94d9c5')

_dir="ign-tools-${pkgname}_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  # Configure build
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib"

  # Compile
  make
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
