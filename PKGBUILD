# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=rfc_reader
pkgver=0.11.2
pkgrel=1
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

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked
}

package() {
	cd "$_srcdir"
	install -Dm755 "target/release/rfc_reader" "$pkgdir/usr/bin/rfc_reader"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
