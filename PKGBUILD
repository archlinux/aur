# Maintainer: Jan Ole Zabel <joz@spline.de>
# This package is not maintained by the author himself.
pkgname=doh-proxy
pkgver=0.3.8
pkgrel=0
pkgdesc="A DNS-over-HTTP server proxy written in Rust by jedisct1"
arch=('x86_64')
url="https://github.com/jedisct1/doh-server"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('bb71fbc40d86bb1b635318c994e35535c58a333d10faa41b663e289e91a4e0063225008e7b1d04df4f85bfcff134ff46ca33fe138e738262c99f4c4c3fc919d2')

build() {
	cd "doh-server-$pkgver"
	cargo update
	cargo build --release
}

package() {
	cd "doh-server-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

