# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=sesdiff
pkgver=0.3.1
pkgrel=1
pkgdesc="Generates a shortest edit script (Myers diff) and Levenshtein edit distance between strings"
arch=('x86_64')
url="https://github.com/proycon/sesdiff"
license=('GPL-3.0-or-later')
depends=()
makedepends=('cargo')
_tag="v0.3.1"
_srcdir="sesdiff-0.3.1"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/proycon/sesdiff/tar.gz/refs/tags/$_tag")
sha256sums=('511b0a6c2b1c824d7453395b9a46b2e4858acb10e49175993905b2c0193b43a5')

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked
}

package() {
	cd "$_srcdir"
	install -Dm755 "target/release/sesdiff" "$pkgdir/usr/bin/sesdiff"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
	if [ -f README.md ]; then
		install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	fi
}
