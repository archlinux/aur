# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-rendering
pkgver=8.0.0
pkgrel=2
pkgdesc="C++ library designed to provide an abstraction for different rendering
engines. It offers unified APIs for creating 3D graphics applications."
arch=('x86_64')
url="https://gazebosim.org/libs/rendering"
license=('Apache')
depends=('ignition-common' 'ignition-math' 'ignition-plugin' 'ogre-next')
makedepends=('cmake' 'ignition-cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-rendering/archive/gz-rendering8_${pkgver}.tar.gz")
sha256sums=('9155927d2ed13237c0aab6b0dafbfdc87eac91213341f8559c9d84c0eebbbe25')

_dir="gz-rendering-gz-rendering8_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING=OFF

  make
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
