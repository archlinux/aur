# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=rustyforge
pkgver=0.4.1
pkgrel=1
pkgdesc="Minimal build manager for C/C++ projects, automates compiling binaries and libraries"
arch=('x86_64')
url="https://github.com/konni332/rustyforge"
license=('MIT')
depends=()
makedepends=('cargo')
_tag="v0.4.1"
_srcdir="rustyforge-0.4.1"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/konni332/rustyforge/tar.gz/refs/tags/$_tag")
sha256sums=('47b55ebd04e4a507850992ba9272b3ae8e34e6553b9ce227b26e8202e9c14a48')

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release
}

package() {
	cd "$_srcdir"
	install -Dm755 "target/release/rustyforge" "$pkgdir/usr/bin/rustyforge"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
