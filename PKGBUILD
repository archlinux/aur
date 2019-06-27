# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
# Contributor: marauder <abhinav.kssk@gmail.com>
pkgname=ignition-tools
pkgver=0.2.0
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
sha256sums=('06c4207dee0242cf4e9d8ed01b1b145a1812b4e223f616b3591eb27e2da5781a')

_dir="ignitionrobotics-ign-tools-d86279474605"

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
