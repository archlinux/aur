# Maintainer: Robin Krahl <robin.krahl@ireas.org>
pkgname=nitrocli
pkgver=0.2.0
pkgrel=2
pkgdesc="Command-line interface for Nitrokey devices"
arch=('x86_64')
url="https://github.com/d-e-s-o/nitrocli"
license=('GPL3')
depends=('hidapi' 'gnupg')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz"::https://crates.io/api/v1/crates/$pkgname/$pkgver/download)
sha512sums=('aca356201c29ed670595d2d637edc2ce15df0a59a6843c68632b702fc92dd8df85cf6e17eed6d5d95e8dd2e83e1f15c3691f2e9bd1aeb0fc908c2217af7e74ae')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/nitrocli "$pkgdir"/usr/bin/nitrocli
	install -Dm644 doc/nitrocli.1 "$pkgdir"/usr/share/man/man1/nitrocli.1
}
