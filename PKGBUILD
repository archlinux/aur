# Maintainer: hexchain <i at hexchain dot org>

pkgname=pcm
pkgver=202205
pkgrel=1
pkgdesc="Processor Counter Monitor"
url="https://github.com/opcm/pcm"
arch=('x86_64')
license=('custom:BSD-3-Clause')
depends=('gcc-libs' 'simdjson')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('6929dbab8eab5470e7cc6bb8f7401e1e958c3da2381ab3057e09dd8dd569d2b5')

build() {
    cd "$srcdir"

    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=2}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=2}"
    cmake -B build -G Ninja "$pkgname-$pkgver"
    cmake --build build
}

package() {
    cd "$srcdir"

    cmake --install build --prefix "$pkgdir/usr"
    mv "$pkgdir/usr/sbin"/* "$pkgdir/usr/bin"
    rm -r "$pkgdir/usr/sbin"
}
