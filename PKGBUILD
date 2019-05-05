# Maintainer: Jan Ole Zabel <joz@spline.de>
# This package is not maintained by the author himself.
pkgname=doh-proxy
pkgver=0.1.12
pkgrel=0
pkgdesc="A DNS-over-HTTP server proxy written in Rust"
arch=('x86_64')
url="https://github.com/jedisct1/rust-doh"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("https://github.com/jedisct1/rust-doh/archive/$pkgver.tar.gz")
sha512sums=('ba585c7b1584eecc6c8b93bcf8ec4677cce1c0ff75b1c97b02a6af5a2633ab61b103803cf8c548e435d66b0def993a83db99fdbdfcd6d1b92aebbaecd0f5cb31')

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

