# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
# Contributor: marauder <abhinav.kssk@gmail.com>
pkgname=ignition-tools
pkgver=1.5.0
pkgrel=2
pkgdesc="Ignition tools provide the ign command line tool that accepts multiple subcommands."
arch=('any')
url="https://github.com/gazebosim/gz-tools"
license=('Apache')
groups=('development')
makedepends=('cmake' 'ignition-cmake' 'doxygen' 'pkg-config' 'ruby-ronn')
depends=('ruby')
optdepends=()
conflicts=()
source=("$url/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('cc99189063b6556e539836a438bdbb9da6eca1fe95a7058d46bfc17debc3d8f5')

_dir="gz-tools-${pkgname}_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib"

  make
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
