# Maintainer: hexchain <i at hexchain dot org>

pkgname=pcm
pkgver=202005
pkgrel=1
pkgdesc="Processor Counter Monitor"
url="https://github.com/opcm/pcm/"
arch=('x86_64')
license=('custom:BSD-3-Clause')
depends=('gcc-libs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8fb4e382da22987ea2cbe14e6035bf3d6f91fee88523fb7fadb9e20fd924628d')

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
