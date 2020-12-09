# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-rendering
pkgver=4.1.0
pkgrel=1
pkgdesc="C++ library designed to provide an abstraction for different rendering
engines. It offers unified APIs for creating 3D graphics applications."
arch=('x86_64')
url="https://ignitionrobotics.org/libs/rendering"
license=('Apache')
depends=()
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-rendering/archive/${pkgname}4_${pkgver}.tar.gz")
sha256sums=('465e858332d5b0e608888e9d62d08f779c7d99d0a51f2de7ba23ba640cdd4be4')

_dir="ign-rendering-${pkgname}4_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  # Configure build
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING=OFF

  # Compile
  make
}

package() {
  cd "$srcdir/$_dir/build"
  #make DESTDIR="$pkgdir/" install
  make install
}
