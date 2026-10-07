# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=rfc_reader
pkgver=0.11.2
pkgrel=2
pkgdesc="TUI to fetch, cache, and browse RFCs (Request for Comments)"
arch=('x86_64')
url="https://github.com/ozan2003/rfc_reader"
license=('MIT')
depends=()
makedepends=('cargo')
_tag="v0.11.2"
_srcdir="rfc_reader-0.11.2"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/ozan2003/rfc_reader/tar.gz/refs/tags/$_tag")
sha256sums=('e58ccf29dc272bcc199c7a9d9418cc6c8aaea78cc7e8680581a5653d17e38350')

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
	install -Dm755 "target/release/rfc_reader" "$pkgdir/usr/bin/rfc_reader"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
