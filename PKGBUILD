# Maintainer: Jan Ole Zabel <joz@spline.de>
# This package is not maintained by the author himself.
pkgname=doh-proxy
pkgver=0.1.16
pkgrel=0
pkgdesc="A DNS-over-HTTP server proxy written in Rust by jedisct1"
arch=('x86_64')
url="https://github.com/jedisct1/rust-doh"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("https://github.com/jedisct1/rust-doh/archive/$pkgver.tar.gz")
sha512sums=('92e9648ddec9d0c7426f744be30a898856fc6cc9a8be53df81781e1260be4a4785b9b62d5f45978f86dddeb800093a0bf38765978c42f5c099abff36ad0d50c9')

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

