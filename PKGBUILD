# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=dirdiff
pkgver=0.2.0
pkgrel=1
pkgdesc="Efficiently compute the differences between two directories"
arch=('x86_64')
url="https://github.com/OCamlPro/dirdiff"
license=('MIT')
depends=()
makedepends=('cargo')
_tag="v0.2.0"
_srcdir="dirdiff-0.2.0"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/OCamlPro/dirdiff/tar.gz/refs/tags/$_tag")
sha256sums=('87ed32a7dcd543b434e4f1d87e414934993ca15a2874af0683372593a5fa3d06')
function build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked || cargo build --release
}
function package() {
	cd "$_srcdir"
	install -Dm755 "target/release/dirdiff" "$pkgdir/usr/bin/dirdiff"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
	if [ -f README.md ]; then
		install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	fi
}
