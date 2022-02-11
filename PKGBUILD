# Maintainer: Nxxx <nx dot tardis at gmail dot com>

pkgname=ignition-common-3
pkgver=3.13.1
pkgrel=1
pkgdesc="A collection of useful classes and functions for handling many command tasks. This includes parsing 3D mesh files, managing console output, and using PID controllers."
arch=('any')
url="https://ignitionrobotics.org/libs/common"
license=('Apache')
groups=('development')
depends=('ignition-math>=6' 'tinyxml2' 'freeimage' 'libutil-linux' 'gts' 'ffmpeg')
makedepends=('ignition-cmake>=2' 'util-linux')
optdepends=()
provides=("ignition-common=$pkgver")
conflicts=("")
source=("https://github.com/ignitionrobotics/ign-common/archive/ignition-common3_${pkgver}.tar.gz")
sha256sums=('572c9ed8741ec8ee1118edbcde2314207f85c40bbcc7673859bfa11bcdae2a71')

_dir="ign-common-ignition-common3_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  # Configure build
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