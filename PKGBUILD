# Maintainer: J.R. Hill <hiljusti@so.dang.cool>
pkgname="sigi"
pkgver="3.2.2"
pkgrel=1
pkgdesc="Organization CLI for people who hate organization"
arch=('x86_64' 'aarch54')
url="https://github.com/hiljusti/sigi"
license=('GPL-2.0-only')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/sigi/$pkgver/download")
sha256sums=('aaed19deaecac0c5976fb8ed195555eb227fa0a3e648570b47928125f5848c7f')

build() {
	cd "$pkgname-$pkgver"

	cargo build --release --locked
}

check() {
	cd "$pkgname-$pkgver"

	# Tests are skipped until https;//github.com/hiljusti/sigi/issues/19
	SKIP_BATS_TESTS=1 cargo test --release --locked
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 "target/release/sigi" "$pkgdir/usr/bin/sigi"

	install -Dm644 "sigi.1" "$pkgdir/usr/share/man/man1/sigi.1"
}

