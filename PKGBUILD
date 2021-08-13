# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=webhook-httpd
pkgver=0.1.2
pkgrel=1
pkgdesc="simple HTTP(S) server for receiving webhooks and running commands"
arch=("x86_64")
license=(BSD)
url="https://github.com/de-vri-es/webhook-httpd"

source=("$pkgname-v$pkgver.tar.gz::https://github.com/de-vri-es/webhook-httpd/archive/v$pkgver.tar.gz")
sha512sums=('c1a39c1409334db08437b07d5705479f71b7d442d731dc569bb0cd765295b81a97560febcb6dba6424d0ee1cba7c67b5a3e7c50dd30b6b08bb97ee9bdf663035')

makedepends=(rust)

_dir="$pkgname-$pkgver"

build() {
	cd "$_dir"
	cargo build --release --features 'static-openssl'
}

package() {
	cd "$_dir"
	install -m 755 -Dt "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -m 644 -Dt "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE.md"
}

check() {
	cd "$_dir"
	cargo test --release --features 'static-openssl'
}
