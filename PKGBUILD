# Maintainer: Jan Ole Zabel <joz@spline.de>
# This package is not maintained by the author himself.
pkgname=doh-proxy
pkgver=0.3.1
pkgrel=0
pkgdesc="A DNS-over-HTTP server proxy written in Rust by jedisct1"
arch=('x86_64')
url="https://github.com/jedisct1/rust-doh"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("https://github.com/jedisct1/rust-doh/archive/$pkgver.tar.gz")
sha512sums=('6f483f805b9e13aab0b622038e270cdc69a552e9a7d536d5e0539fbfe50277b2ceb4c1956f8f014ac8f3674931a1623f670d9417adcf72d5e517d844c5ee150c')

build() {
	cd "rust-doh-$pkgver"
	cargo update
	cargo build --release
}

package() {
	cd "rust-doh-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

