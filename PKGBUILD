# Maintainer: hexchain <i at hexchain dot org>

pkgname=pcm
pkgver=202207
pkgrel=1
pkgdesc="Processor Counter Monitor"
url="https://github.com/opcm/pcm"
arch=('x86_64')
license=('custom:BSD-3-Clause')
depends=('gcc-libs' 'simdjson')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('eb20738d5f082390c336717f4eeaf711ae87cfb8e981dbcd89f1c08ccb9b49ac')

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
