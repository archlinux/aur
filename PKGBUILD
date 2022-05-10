# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Cody <aur AT codyps.com>

pkgname=ignition-plugin
pkgver=1.2.1
pkgrel=1
pkgdesc="Library for registering plugin libraries and dynamically loading them at runtime."
arch=('i686' 'x86_64')
url="https://github.com/gazebosim/gz-plugin"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'ignition-cmake')
source=("https://github.com/gazebosim/gz-plugin/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('2a01fe89bfca332e4a4cac1457080660d4d36c71fc38f7be79868e528d32acb4')

_dir="gz-plugin-${pkgname}_${pkgver}"

build() {
    cd "$srcdir/$_dir"

    mkdir -p build
    cd build

    cmake .. -Wno-dev \
             -DCMAKE_BUILD_TYPE="Release" \
             -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
             -DCMAKE_INSTALL_LIBDIR="lib" \
             -DBUILD_TESTING=OFF

    make
}

package() {
    cd "$srcdir/$_dir/build"
    #make DESTDIR="$pkgdir/" install
    make install
}
