# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=webhook-httpd
pkgver=0.1.6
pkgrel=1
pkgdesc="simple HTTP(S) server for receiving webhooks and running commands"
arch=("x86_64")
license=(BSD)
url="https://github.com/de-vri-es/webhook-httpd"

source=("$pkgname-v$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('3d3fd023ee27fd7f31b5cea0d96202969a99f034e5cf416f7a9e1e62bbe041aa2f78aad3c578408085184a3d78061ce1f4ae830a2c55885d4c59b6086d7960b3')

depends=(openssl)
makedepends=(rust)

_dir="$pkgname-$pkgver"

build() {
	cd "$_dir"
	cargo build --release
}

package() {
	cd "$_dir"
	install -m 755 -Dt "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -m 644 -Dt "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE.md"
}

check() {
	cd "$_dir"
	cargo test --release
}
