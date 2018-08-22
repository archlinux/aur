# Maintainer: Jan Ole Zabel <joz@spline.de>
# This package is not maintained by the author himself.
pkgname=doh-proxy
pkgver=0.1.9
pkgrel=0
pkgdesc="A DNS-over-HTTP server proxy written in Rust"
arch=('x86_64')
url="https://github.com/jedisct1/rust-doh"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("https://github.com/jedisct1/rust-doh/archive/$pkgver.tar.gz")
sha512sums=('3103beb8d0a28ac56773787ef648e3ca5b1cc747a1c31622a5560f429b906250856c410c304b5cd95f3db1c66e9e279aa0cc9863b4b55aa26d49acc0a9ae02e4')

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

