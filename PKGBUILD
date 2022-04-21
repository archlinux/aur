# Maintainer: AchmadFathoni <fathoni DOT id AT gmail DOT com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Mykola Dolhyi <0xb000@gmail.com>
# Contributor: Ramdambo <https://github.com/Ramdambo>
pkgname=ignition-math
pkgver=6.10.0
pkgrel=2
pkgdesc="Math classes and functions for robot applications"
arch=('i686' 'x86_64')
url="https://ignitionrobotics.org/libs/math"
license=('Apache')
groups=('development')
depends=('gcc-libs')
makedepends=('ignition-cmake>=2')
optdepends=('eigen')
conflicts=()
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-math/archive/${pkgname}6_${pkgver}.tar.gz"
  "cmake.patch::https://github.com/ignitionrobotics/ign-math/commit/6340f89b4d19e6b6aa38ae632760da264409c1ef.diff"
)
sha256sums=(
  "9e00284cd6d51afe190165b2b44258e19bd4a28781cbacf21fd6b0bae43c16aa"
  "d94835e0c1fe543ac47d7de1ee0906c171ce91c2f4e60bf597172c951d66a605"
)

depends=(
  swig
)

_dir="ign-math-${pkgname}6_${pkgver}"

prepare(){
  patch --directory="$_dir" --forward --strip=1 --input="${srcdir}/cmake.patch"
}

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
