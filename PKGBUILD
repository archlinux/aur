# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
pkgname=ignition-common
pkgver=5.3.1
pkgrel=3
pkgdesc="Provides a set of libraries that cover many different use cases."
arch=('x86_64')
url="https://gazebosim.org/libs/common"
license=('Apache')
depends=('ignition-math>6' 'ignition-utils>1' 'tinyxml2' 'freeimage'
         'libutil-linux' 'gts' 'ffmpeg' 'gdal' 'assimp')
makedepends=('ignition-cmake>2' 'util-linux')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-common/archive/gz-common5_${pkgver}.tar.gz")
sha256sums=('dbb7eb6639fec27bb971d0df6a0d17d8076e82a7a7f3cadb570adab02ab7d9ad')

_dir="gz-common-gz-common5_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  cmake .. -Wno-dev \
           -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING:BOOL=False

  make
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
