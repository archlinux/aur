# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
# Contributor: marauder <abhinav.kssk@gmail.com>
pkgname=ignition-tools
pkgver=1.0.0
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
sha256sums=('268a23b8d45ec771c8e23c3dab3e8102cfeb027b37450be12b05c6655756ac21')

_dir="ignitionrobotics-ign-tools-db789c2424b4"

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
