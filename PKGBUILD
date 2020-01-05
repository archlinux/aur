# Maintainer: Jan Ole Zabel <joz@spline.de>
# This package is not maintained by the author himself.
pkgname=doh-proxy
pkgver=0.2.1
pkgrel=0
pkgdesc="A DNS-over-HTTP server proxy written in Rust by jedisct1"
arch=('x86_64')
url="https://github.com/jedisct1/rust-doh"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("https://github.com/jedisct1/rust-doh/archive/$pkgver.tar.gz")
sha512sums=('5a129a041744b3247a8cfe2032e9cf2f3a6d55ffe778cca7dff566416a6e7116f7031d1e1f5d420582398636fc2cbc89ab7da2fd600039c48527c6470ff2ceef')

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

