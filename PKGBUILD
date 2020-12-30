# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ignition-physics
pkgver=3.1.0
pkgrel=5
pkgdesc="Abstract physics interface designed to support simulation and rapid
development of robot applications."
arch=('x86_64')
url="https://ignitionrobotics.org/libs/physics"
license=('Apache')
depends=('ignition-cmake' 'ignition-math' 'ignition-plugin' 'ignition-common'
         'libdart' 'sdformat')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-physics/archive/${pkgname}3_${pkgver}.tar.gz"
        "entity.patch::https://patch-diff.githubusercontent.com/raw/ignitionrobotics/ign-physics/pull/185.patch")
sha256sums=('b8e5460d2808e20237b2ee0a6a6b7613b56412f5f6e2a5e153e48e8faae8ab77'
            'SKIP')

_dir="ign-physics-${pkgname}3_${pkgver}"

prepare() {
  cd "$srcdir/$_dir"
  patch --forward --strip=1 --input="${srcdir}/entity.patch"
}

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
