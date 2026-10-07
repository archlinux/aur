# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=vicut
pkgver=0.4.2
pkgrel=2
pkgdesc="A CLI text processor that uses Vim commands to transform text and extract fields"
arch=('x86_64')
url="https://github.com/km-clay/vicut"
license=('MIT')
depends=()
makedepends=('cargo')
_tag="v0.4.2"
_srcdir="vicut-0.4.2"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/km-clay/vicut/tar.gz/refs/tags/$_tag")
sha256sums=('8648e99839764ea769ecdf94f36b52b6b950da4ba131ad150090441c2b487e8c')

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
	install -Dm755 "target/release/vicut" "$pkgdir/usr/bin/vicut"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	if [ -f README.md ]; then
		install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	fi
}
