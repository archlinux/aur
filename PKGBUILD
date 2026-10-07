# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=lineselect
pkgver=0.2.3
pkgrel=1
pkgdesc="Interactive line selection from stdin for use in shell pipelines"
arch=('x86_64')
url="https://github.com/urbanogilson/lineselect"
license=('MIT')
depends=()
makedepends=('cargo')
_tag="v0.2.3"
_srcdir="lineselect-0.2.3"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/urbanogilson/lineselect/tar.gz/refs/tags/$_tag")
sha256sums=('b368f206b5dba367f614fb584c88ac9f4d1dc9199882488f84ba699dd70e6924')

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
	install -Dm755 "target/release/lineselect" "$pkgdir/usr/bin/lineselect"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 .github/example.gif "$pkgdir/usr/share/doc/$pkgname/example.gif"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
