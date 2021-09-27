# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-rendering
pkgver=5.1.0
pkgrel=1
pkgdesc="C++ library designed to provide an abstraction for different rendering
engines. It offers unified APIs for creating 3D graphics applications."
arch=('x86_64')
url="https://ignitionrobotics.org/libs/rendering"
license=('Apache')
depends=('ignition-plugin')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-rendering/archive/${pkgname}5_${pkgver}.tar.gz")
sha256sums=('a26fe32f2dd849bb2ae492fc65b73e730f830f5bf9d763c9e62b6d6672ccf02f')

_dir="ign-rendering-${pkgname}5_${pkgver}"

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
