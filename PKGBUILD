# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Cody <aur AT codyps.com>

pkgname=ignition-plugin
pkgver=2.0.1
pkgrel=2
pkgdesc="Cross-platform C++ library for dynamically loading plugins."
arch=('i686' 'x86_64')
url="https://github.com/gazebosim/gz-plugin"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'ignition-cmake' 'ignition-utils')
source=("https://github.com/gazebosim/gz-plugin/archive/gz-plugin2_${pkgver}.tar.gz")
sha256sums=('c5f1a9eb3addf7becf0597f18eadd124951febd14fe270fe250990f92e977c2c')

_dir="gz-plugin-gz-plugin2_${pkgver}"

build() {
    cd "$srcdir/$_dir"

    mkdir -p build
    cd build

    cmake .. -Wno-dev \
             -DCMAKE_BUILD_TYPE="Release" \
             -DCMAKE_INSTALL_PREFIX="/usr" \
             -DCMAKE_INSTALL_LIBDIR="lib" \
             -DBUILD_TESTING=OFF

    make
}

package() {
    cd "$srcdir/$_dir/build"
    make DESTDIR="$pkgdir/" install
}
