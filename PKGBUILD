# Maintainer: hexchain <i at hexchain dot org>

pkgname=pcm
pkgver=202210
pkgrel=1
pkgdesc="Processor Counter Monitor"
url="https://github.com/opcm/pcm"
arch=('x86_64')
license=('custom:BSD-3-Clause')
depends=('gcc-libs' 'simdjson')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('faec5b7923d0bc0018c090df594b1bf562428a08ab243cbb5c973e4b7ab6b126')

build() {
    cd "$srcdir"

    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=2}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=2}"
    cmake -B build -G Ninja "$pkgname-$pkgver" -DCMAKE_INSTALL_SBINDIR=bin
    cmake --build build
}

package() {
    cd "$srcdir"

    cmake --install build --prefix "$pkgdir/usr"
}
