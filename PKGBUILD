# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-physics
pkgver=5.2.0
pkgrel=1
pkgdesc="Abstract physics interface designed to support simulation and rapid
development of robot applications."
arch=('x86_64')
url="https://gazebosim.org/libs/physics"
license=('Apache')
depends=('ignition-cmake' 'ignition-math' 'ignition-plugin' 'ignition-common'
         'libdart' 'sdformat')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-physics/archive/${pkgname}5_${pkgver}.tar.gz")
sha256sums=('75acb91a17c2a4988d50848355a771cfa49235ff2eb9500951c10eacc945b4d0')

_dir="gz-physics-${pkgname}5_${pkgver}"

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
  make DESTDIR="${pkgdir}/" install
}
