# Maintainer: hexchain <i at hexchain dot org>

pkgname=pcm
pkgver=202008
pkgrel=1
pkgdesc="Processor Counter Monitor"
url="https://github.com/opcm/pcm"
arch=('x86_64')
license=('custom:BSD-3-Clause')
depends=('gcc-libs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('38722e53b0fde5aae450abf871c0bd4c55a5152c28493dd989f800c58cb21f1f')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i '/^%\.x:/!b;n;s/$(CXX)/$(CXX) $(LDFLAGS)/' Makefile
    sed -i '/^pcm-sensor-server\.x:/!b;n;s/$(CXX)/$(CXX) $(LDFLAGS)/' Makefile
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 ./*.x -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
