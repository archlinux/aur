# Maintainer: Julian Corbet <julian.corbet@gmail.com>
pkgname=nixwatch
pkgver=0.1.0
pkgrel=1
pkgdesc="Streams the Gatus observability dashboard to nixlock's kiosk display socket"
arch=('x86_64')
url="https://github.com/julian-corbet/nixwatch-corbet-ch"
license=('MIT')
depends=()
makedepends=('cargo')
provides=('nixwatch')
conflicts=('nixwatch-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/julian-corbet/nixwatch-corbet-ch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bc03461ff0bab93cf9dfcd9ce266fcd5ca70caf7d2dc6b5401237dea5b21b587')

build() {
    cd "nixwatch-corbet-ch-$pkgver"
    cargo build --release --frozen --bin nixwatch-frames
}

package() {
    cd "nixwatch-corbet-ch-$pkgver"
    install -Dm755 "target/release/nixwatch-frames" "$pkgdir/usr/bin/nixwatch-frames"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
