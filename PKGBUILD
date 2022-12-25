# Maintainer: hexchain <i at hexchain dot org>

pkgname=pcm
pkgver=202212
pkgrel=1
pkgdesc="Processor Counter Monitor"
url="https://github.com/opcm/pcm"
arch=('x86_64')
license=('custom:BSD-3-Clause')
depends=('gcc-libs' 'simdjson')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('cebc053b42bbc78e19f53b3fbe7a9cb90bff8bcb17d9178e9542f5a661f0bef33b9f3cfd245fd0c055cd4353b00ad5d177fd8f1f55ff241212535daf34c3177d')

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
