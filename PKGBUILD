# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=qbak
pkgver=1.5.1
pkgrel=1
pkgdesc="Single-command backup helper for Linux/POSIX, written in Rust"
arch=('x86_64')
url="https://github.com/andreas-glaser/qbak"
license=('MIT')
depends=()
makedepends=('cargo')
_tag="v1.5.1"
_srcdir="qbak-1.5.1"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/andreas-glaser/qbak/tar.gz/refs/tags/$_tag")
sha256sums=('51d4bf3f8b893ffb6b09617e8236e49e9294b28526acae8d6cff8e248b2ab14a')
function build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked || cargo build --release
}
function package() {
	cd "$_srcdir"
	install -Dm755 "target/release/qbak" "$pkgdir/usr/bin/qbak"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
