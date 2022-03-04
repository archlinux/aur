# Maintainer: Homalozoa <nx.tardis@gmail.com>

pkgname=ignition-common-3
pkgver=3.14.0
pkgrel=2
pkgdesc="A collection of useful classes and functions for handling many command tasks. This includes parsing 3D mesh files, managing console output, and using PID controllers."
arch=('any')
url="https://ignitionrobotics.org/libs/common"
license=('Apache')
groups=('development')
depends=('ignition-math>=6' 'tinyxml2' 'freeimage' 'libutil-linux' 'gts' 'ffmpeg4.4')
makedepends=('ignition-cmake>=2' 'util-linux')
optdepends=()
provides=("ignition-common=$pkgver")
source=("https://github.com/ignitionrobotics/ign-common/archive/ignition-common3_${pkgver}.tar.gz")
sha256sums=('90b5d0d37c17ea92becbf3e339d99ce777336ad076e3c9550340e3ad33b4ff52')

_dir="ign-common-ignition-common3_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  # Configure build
  export PKG_CONFIG_PATH=/usr/lib/ffmpeg4.4/pkgconfig
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING:BOOL=False

  # Compile
  make
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
