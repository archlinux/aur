# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Maintainer: Homalozoa <nx.tardis@gmail.com>

pkgname=ignition-common-3
pkgver=3.15.1
pkgrel=1
pkgdesc="Provides a set of libraries that cover many different use cases."
arch=('x86_64')
url="https://gazebosim.org/libs/common"
license=('Apache')
groups=('development')
depends=('ignition-math=6' 'tinyxml2' 'freeimage' 'libutil-linux' 'gts' 'ffmpeg')
makedepends=('ignition-cmake=2' 'util-linux')
provides=("ignition-common=3")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-common/archive/ignition-common3_${pkgver}.tar.gz"
        "missing-include-cstring.patch::https://github.com/gazebosim/gz-common/commit/465bb7780e552b278de559fafaffe3d061a99782.patch")
sha256sums=('fc1bf79eb53e3b56b4b8e0eb6965ec68982da18ea42154dd4fd891ac739d65fb'
            '9a6f2d45a1c2146150336e25162f6ba46f19db1deb46b2b644a8faa3afe3d7af')

_dir="gz-common-ignition-common3_${pkgver}"

prepare() {
  cd "$srcdir/$_dir"
  patch -p1 < ../missing-include-cstring.patch
}

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING:BOOL=False

  make
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
