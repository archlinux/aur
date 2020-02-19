# Maintainer: Lloyd Henning <lloyd.w.henning@gmail.com>
# Maintainer: Felix Pfeiffer <fepf@freeshell.de>
pkgname=aruco
pkgver=3.1.11
pkgrel=1
pkgdesc="ArUco is a C++ library for detection of squared planar markers based on OpenCV"
arch=('any')
url="https://www.uco.es/investiga/grupos/ava/node/26"
license=('GPLv3')
depends=('opencv')
makedepends=('cmake')
options=()
source=("https://downloads.sourceforge.net/project/aruco/$pkgver/$pkgname-$pkgver.zip")
md5sums=('68c39f743f9b4ed9d292fa8d87a964ab')

_builddir="$pkgname-$pkgver-build"

prepare() {
    mkdir -p "$_builddir"
    cd "$_builddir"
    cmake "../$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
    cd "$_builddir"
    make -j $(nproc)
}

check() {
    # print marker with id 0 of the default dictionary
    "$_builddir"/utils/aruco_print_marker 0 out.png
}

package() {
    cd "$_builddir"
    make DESTDIR="$pkgdir" install
}
