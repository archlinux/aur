# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Cody <aur AT codyps.com>

pkgname=ignition-plugin
pkgver=1.3.0
pkgrel=1
pkgdesc="Library for registering plugin libraries and dynamically loading them at runtime."
arch=('i686' 'x86_64')
url="https://github.com/gazebosim/gz-plugin"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'ignition-cmake')
source=("https://github.com/gazebosim/gz-plugin/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('504c6ef66d48342d92ec7b227a134485ae79946df16094843f33d80f9af34e08')

_dir="gz-plugin-${pkgname}_${pkgver}"

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
