# Maintainer: Tomas Chlubna <ichlubna at fit dot vut dot cz>
pkgname=lunasvg
pkgver=3.5.0
pkgrel=1
pkgdesc="standalone SVG rendering library in C++ "
arch=('x86_64' 'aarch64')
url="https://github.com/sammycage/lunasvg"
license=('MIT')
makedepends=('cmake')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1abf1472ee6c4d19797916e8cc3c2e4b628e0d81178ffac60bdb0d457e32c690')
CFLAGS+=" -ffat-lto-objects"
CXXFLAGS+=" -ffat-lto-objects"

build() {
    cd "$pkgname-$pkgver"
    rm -fr build
    rm -fr plutovg
    git clone git@github.com:sammycage/plutovg.git
    cmake -B build . -DCMAKE_INSTALL_PREFIX=/usr/
    cmake --build build
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}
