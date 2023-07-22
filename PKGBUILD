# Maintainer: hexchain <i at hexchain dot org>

pkgname=pcm
pkgver=202307
pkgrel=1
pkgdesc="Processor Counter Monitor"
url="https://github.com/intel/pcm"
arch=('x86_64')
license=('custom:BSD-3-Clause')
depends=('gcc-libs' 'simdjson')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('16c07b17bdf015a0ce29a9bfb755ea18570c1d2907aa33313b9ac44ac4e45889464d47d832770c8ad2ed04f982f020c8a056eda7be929dcc32ca5a083aa36dce')

build() {
    cd "$srcdir"

    sed -i 's/-D_FORTIFY_SOURCE=1//' "$pkgname-$pkgver/CMakeLists.txt"

    cmake -B build -G Ninja "$pkgname-$pkgver" -DCMAKE_INSTALL_SBINDIR=bin
    cmake --build build
}

package() {
    cd "$srcdir"

    cmake --install build --prefix "$pkgdir/usr"
}
