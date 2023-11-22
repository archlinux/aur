# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
pkgname=ignition-common
pkgver=5.4.2
pkgrel=1
pkgdesc="Provides a set of libraries that cover many different use cases."
arch=('x86_64')
url="https://gazebosim.org/libs/common"
license=('Apache')
depends=('ignition-math>6' 'ignition-utils>1' 'tinyxml2' 'freeimage'
         'libutil-linux' 'gts' 'ffmpeg4.4' 'gdal' 'assimp')
makedepends=('ignition-cmake>2' 'util-linux')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-common/archive/gz-common5_${pkgver}.tar.gz")
sha256sums=('28b06f87b338eb016545ed1df3900a81fe3d1815661dea296a8e8704ab2eacca')

_dir="gz-common-gz-common5_${pkgver}"
build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  export PKG_CONFIG_PATH=/usr/lib/ffmpeg4.4/pkgconfig
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
