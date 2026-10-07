# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=is-fast
pkgver=0.17.7
pkgrel=2
pkgdesc="TUI tool for quick, efficient internet searches directly from the terminal"
arch=('x86_64')
url="https://github.com/Magic-JD/is-fast"
license=('MIT')
depends=()
makedepends=('cargo')
_tag="v0.17.7"
_srcdir="is-fast-0.17.7"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/Magic-JD/is-fast/tar.gz/refs/tags/$_tag")
sha256sums=('031ac21094cb3b276c3b36eee114aec6b9dd978e91aa4fe2cd4f669c35002963')

prepare() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$_srcdir"
	install -Dm755 "target/release/is-fast" "$pkgdir/usr/bin/is-fast"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
	install -d "$pkgdir/usr/share/doc/$pkgname/demos"
	install -Dm644 demos/*.gif demos/DEMOS.md "$pkgdir/usr/share/doc/$pkgname/demos/"
	install -d "$pkgdir/usr/share/$pkgname/scripts"
	install -Dm755 scripts/is-fast-projects.sh "$pkgdir/usr/share/$pkgname/scripts/is-fast-projects.sh"
	install -Dm644 scripts/is-fast-projects.ps1 "$pkgdir/usr/share/$pkgname/scripts/is-fast-projects.ps1"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
