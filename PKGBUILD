# Maintainer: jpk68 <jpk68@tutanota.com>

pkgname=cuprate
pkgver=0.0.9
pkgrel=1
pkgdesc="Cuprate, a modular Monero node written in Rust."
arch=(x86_64)
url="https://github.com/Cuprate/cuprate"
license=('AGPL-3.0-or-later' 'MIT')
depends=('glibc' 'libgcc' 'openssl' 'sqlite' 'xz')
makedepends=('git' 'cargo' 'cmake')
options=('!lto')

source=("git+$url.git#tag=cuprated-$pkgver")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	cargo build --release --locked
}

check() {
	cd "$pkgname"
	cargo test --release --locked
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/cuprated" -t "$pkgdir/usr/bin"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

	install -Dm644 binaries/cuprated/cuprated.service \
		"$pkgdir/usr/lib/systemd/system/cuprated.service"
}
