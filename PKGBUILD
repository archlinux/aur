# Maintainer: Viktor Schneider <info[at]vjs[dot]io>
pkgname=tl-expected
pkgver=1.0.0
pkgrel=1
pkgdesc="C++11/14/17 std::expected with functional-style extensions"
arch=('any')
url="https://github.com/TartanLlama/expected"
license=('custom:CC0')
makedepends=('cmake>=3.14.0' 'catch2')
source=("expected-v1.0.0.tar.gz::https://github.com/TartanLlama/expected/archive/v1.0.0.tar.gz")
sha256sums=("8f5124085a124113e75e3890b4e923e3a4de5b26a973b891b3deb40e19c03cee")

build() {
    cd "expected-$pkgver"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

check() {
    cd "expected-$pkgver/build"
    ./tests
}

package() {
    cd "expected-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    cd ..
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
