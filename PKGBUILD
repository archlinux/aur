# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=libzstd-seek-git
pkgver=r18.0d073ce
pkgrel=1
pkgdesc="A library that mimic fread, fseek and ftell for reading zstd compressed files."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/martinellimarco/libzstd-seek"
license=('MIT')
provides=("libzstd-seek")
depends=('zstd')
makedepends=('cmake' 'git')
options=('staticlibs')
source=("git+https://github.com/martinellimarco/libzstd-seek.git")
sha384sums=('SKIP')

pkgver() {
	cd "$srcdir/libzstd-seek"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/libzstd-seek"
    rm -rf build
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "$srcdir/libzstd-seek"
    install -Dm644 build/libzstd-seek.a "$pkgdir/usr/lib/libzstd-seek.a"
    install -Dm644 zstd-seek.h "$pkgdir/usr/include/libzstd-seek/zstd-seek.h"
}
