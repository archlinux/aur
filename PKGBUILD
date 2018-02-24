# Maintainer: Tim Rakowski <tim.rakowski@gmail.com>
# Contributor: marauder <abhinav.kssk@gmail.com>
pkgname=ignition-tools
pkgver=0.1.0
pkgrel=1
pkgdesc="Ignition tools provide the ign command line tool that accepts multiple subcommands."
arch=('any')
url="https://bitbucket.org/ignitionrobotics/ign-tools"
license=('Apache')
groups=('development')
makedepends=('cmake' 'doxygen' 'pkg-config' 'ruby-ronn')
depends=('ruby')
optdepends=()
conflicts=()
source=("https://bitbucket.org/ignitionrobotics/ign-tools/get/${pkgname}_${pkgver}.tar.bz2")
sha256sums=('c347edd7ecf44a360ae1285f34d33ac121a627562b2cf6b44f04ddb99417453b')

_dir="ignitionrobotics-ign-tools-e775d6356667"

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
