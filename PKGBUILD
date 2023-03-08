# Maintainer: hexchain <i at hexchain dot org>

pkgname=pcm
pkgver=202302
pkgrel=1
pkgdesc="Processor Counter Monitor"
url="https://github.com/opcm/pcm"
arch=('x86_64')
license=('custom:BSD-3-Clause')
depends=('gcc-libs' 'simdjson')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('f38a23087759ca5a7b8c9bb74f8238da139ddb7ca9cf9cd60d084d4db969d792c243f6236ba692828076883168d589180f256d4208cccc597df762c2aac26d97')

build() {
    cd "$srcdir"

    # suppress redefined warnings
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=2}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=2}"

    cmake -B build -G Ninja "$pkgname-$pkgver" -DCMAKE_INSTALL_SBINDIR=bin
    cmake --build build
}

package() {
    cd "$srcdir"

    cmake --install build --prefix "$pkgdir/usr"
}
