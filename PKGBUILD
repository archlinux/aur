# Maintainer: Marco Martinelli <marco+libzstd-seek@13byte.com>

pkgname=libzstd-seek
pkgver=1.2.0
pkgrel=1
pkgdesc="A library that mimic fread, fseek and ftell for reading zstd compressed files."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/martinellimarco/libzstd-seek"
license=('GPL3' 'MIT')
provides=("libzstd-seek")
depends=('zstd')
makedepends=('cmake' 'git')
options=('staticlibs')
source=("${pkgname}-${pkgver}::git+https://github.com/martinellimarco/libzstd-seek.git#tag=v${pkgver}")
sha384sums=('SKIP')

build() {
    cd "$srcdir/libzstd-seek-$pkgver"
    rm -rf build
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "$srcdir/libzstd-seek-$pkgver"
    install -Dm644 build/libzstd-seek.a "$pkgdir/usr/lib/libzstd-seek.a"
    install -Dm644 zstd-seek.h "$pkgdir/usr/include/libzstd-seek/zstd-seek.h"
}
