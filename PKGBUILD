# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=image-roll
pkgver=1.0.0
pkgrel=2
pkgdesc="A simple and fast GTK image viewer with basic image manipulation tools"
arch=('x86_64')
url="https://github.com/weclaw1/image-roll"
license=('MIT')
depends=('gtk3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b17583c940ea65682855f23c0d947014f35bd43fefb90e7128963010b86b48ef')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked --target-dir=target
}

package() {
	cd "$pkgname-$pkgver"
	install -Dvm 755 target/release/image-roll -t "$pkgdir/usr/bin/"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
