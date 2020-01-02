# Maintainer: Damien Flament <damien.flament at gmx dot com>

_repository='libdxfrw'
pkgname=libdxfrw-git
pkgver=v0.5.10.r73.g3431cc6
pkgrel=1
pkgdesc="C++ library to read/write DXF files in binary and ASCII form and to read DWG files from r14 to v2015."
arch=('x86_64')
url="http://sourceforge.net/projects/libdxfrw"
license=('GPL')

depends=()
makedepends=('git' 'cmake')
provides=('libdxfrw')
conflicts=('libdxfrw')

source=("git+https://github.com/LibreCAD/$_repository.git")
md5sums=('SKIP')

pkgver() {
    cd "$_repository" || return

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cmake -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -S "$_repository" \
        -B build \
        -DCMAKE_BUILD_TYPE=Release
}

build() {
    cd build || return

    make
}

package() {
    cd build || return

    make install DESTDIR="$pkgdir"
}
