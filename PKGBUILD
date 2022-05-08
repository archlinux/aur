# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>

pkgname=ignition-cmake
pkgver=2.12.1
pkgrel=3
pkgdesc="Provides modules that are used to find dependencies of ignition projects and generate cmake targets for consumers of ignition projects to link against."
arch=('any')
url="https://gazebosim.org/libs/cmake"
license=('Apache')
depends=('cmake' 'pkg-config' 'ruby-ronn' 'doxygen')
optdepends=()
conflicts=()
source=("https://github.com/gazebosim/gz-cmake/archive/${pkgname}2_${pkgver}.tar.gz")
sha256sums=('34f6d8faa00401d0eb3228f6ac112b89e49a5946f04beda3ad84e7171016d893')

_dir="gz-cmake-${pkgname}2_${pkgver}"

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  # Configure build
  cmake .. -Wno-dev \
           -DCMAKE_BUILD_TYPE="Release" \
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
