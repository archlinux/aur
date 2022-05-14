# Maintainer: J.R. Hill <hiljusti@so.dang.cool>
pkgname="sigi"
pkgver="3.4.0"
pkgrel=1
pkgdesc="Organization CLI for people who hate organization"
arch=('x86_64' 'aarch54')
url="https://github.com/hiljusti/sigi"
license=('GPL-2.0-only')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/sigi/$pkgver/download")
sha256sums=('f12fb8bcbc1b1c8e1cbe45c5330339e2711be7cd5e3decf3c73d105cf20bf339')

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

