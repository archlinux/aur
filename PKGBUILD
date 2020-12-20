# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=webhook-httpd
pkgver=0.1.1
pkgrel=1
pkgdesc="simple HTTP(S) server for receiving webhooks and running commands"
arch=("x86_64")
license=(BSD)
url="https://github.com/de-vri-es/webhook-httpd"

source=("$pkgname-v$pkgver.tar.gz::https://github.com/de-vri-es/webhook-httpd/archive/v$pkgver.tar.gz")
sha512sums=('e180c8a845dd63a42105b3ee9e611f9254c20c35b2ac52633d06ae943191e3b8287149d033269bc85f29d5c519e83469c34b4acc30128293a0c513d95c9607b1')

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
