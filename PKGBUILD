# Maintainer: Viktor Schneider <info[at]vjs[dot]io>
pkgname=tl-function-ref
pkgver=1.0.0
pkgrel=1
pkgdesc="lightweight, C++, non-owning reference to a callable"
arch=('any')
url="https://github.com/TartanLlama/function_ref"
license=('custom:CC0')
makedepends=('cmake>=3.14.0' 'catch2')
source=("function_ref-v1.0.0.tar.gz::https://github.com/TartanLlama/function_ref/archive/v1.0.0.tar.gz")
sha256sums=("6e374c40c40d3978cfcdd4ef9ed1417627898f37ffb306970f86e339644ed3ca")

build() {
    cd "function_ref-$pkgver"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

check() {
    cd "function_ref-$pkgver/build"
    ./tests
}

package() {
    cd "function_ref-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    cd ..
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
