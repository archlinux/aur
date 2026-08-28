# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=claude-code-cleaner
pkgver=0.1.1
pkgrel=1
pkgdesc="Interactive TUI tool to clean up disk space accumulated by Claude Code (~/.claude/)"
arch=('x86_64' 'aarch64')
url="https://github.com/GarrickZ2/claude-code-cleaner"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('52f1edd2ad79534681e648ae1e12d67a1a977e8a9e12bb9d8e76c8cfdb4eca68')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --frozen
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --frozen
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
