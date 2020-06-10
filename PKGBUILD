# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
# Contributor: marauder <abhinav.kssk@gmail.com>
pkgname=ignition-tools
pkgver=1.0.0
pkgrel=2
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
sha256sums=('ea7036e73ad7893fee7c7dc06e1760f11e0cac57c024886a371359ce2768cce7')

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
