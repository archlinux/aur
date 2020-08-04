# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Mykola Dolhyi <0xb000@gmail.com>
# Contributor: Ramdambo <https://github.com/Ramdambo>
pkgname=ignition-math
pkgver=6.4.0
pkgrel=6
pkgdesc="Math classes and functions for robot applications"
arch=('i686' 'x86_64')
url="https://ignitionrobotics.org/libs/math"
license=('Apache')
groups=('development')
depends=('gcc-libs')
makedepends=('ignition-cmake>=2')
optdepends=('eigen')
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ignitionrobotics/ign-math/archive/${pkgname}6_${pkgver}.tar.gz"
"headerfix.patch::https://github.com/ignitionrobotics/ign-math/commit/fdbd226d70885e85e265d7c61cfa9014bee1a33a.patch")
sha256sums=('2961b295c61c7536a10b4e87c1fb812d111ee923e1c83bb6a42dede7d76373c5'
            'ab61c420bfab53fac3e7770f322d2249c9a6058488f45069d0f8d52affdd7236')

_dir="ign-math-${pkgname}6_${pkgver}"


prepare() {
    cd "$srcdir/$_dir"
    patch --forward --strip=1 --input="${srcdir}/headerfix.patch"
}


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

