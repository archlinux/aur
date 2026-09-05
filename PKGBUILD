# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=portfolio_rs
pkgver=0.8.0
pkgrel=1
pkgdesc="Local-first portfolio management for humans and AI agents: CLI, TUI, library, and local HTTP API"
arch=('x86_64')
url="https://github.com/MarkusZoppelt/portfolio_rs"
license=('MIT')
depends=()
makedepends=('cargo')
_tag="v0.8.0"
_srcdir="portfolio_rs-0.8.0"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/MarkusZoppelt/portfolio_rs/tar.gz/refs/tags/$_tag")
sha256sums=('2f4fe8f04be3ccb76922c88af4e0791af07fd9cb9b4dd06fdf0af54a29e427e0')

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked
}

package() {
	cd "$_srcdir"
	install -Dm755 "target/release/portfolio_rs" "$pkgdir/usr/bin/portfolio_rs"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
	if [ -f README.md ]; then
		install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	fi
}
