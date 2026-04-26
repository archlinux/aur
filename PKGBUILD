# Maintainer: Juliandev02 <julian@strawberryfoundations.org>

pkgname=tunneled
pkgver=2.5.2
pkgrel=1
pkgdesc="A simple and powerful CLI tool for creating TCP tunnels"
arch=('x86_64' 'aarch64')
url="https://github.com/Strawberry-Foundations/tunneled"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'rust')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('715c35189a25b23e8112ee3d9ec77f7e6f8a815d53a1aa33c26648defd6c8f74')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "config.example.yml" "$pkgdir/usr/share/$pkgname/config.example.yml"
	install -Dm644 "services.example.yml" "$pkgdir/usr/share/$pkgname/services.example.yml"
}
