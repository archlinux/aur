# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=ccsum
pkgver=0.2.3
pkgrel=1
pkgdesc="Convenient sha256sum/md5sum/sha1sum/sha512sum checksum tool with improved usability"
arch=('x86_64')
url="https://github.com/sevenc-nanashi/ccsum"
license=('MIT')
depends=()
makedepends=('cargo')
_tag="v0.2.3"
_srcdir="ccsum-0.2.3"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/sevenc-nanashi/ccsum/tar.gz/refs/tags/$_tag")
sha256sums=('f65087709ea4181caedb43dcc4c4b2beb83bc64c75deefd2f67aa7292b9efd02')

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked
}

package() {
	cd "$_srcdir"
	install -Dm755 "target/release/ccsum" "$pkgdir/usr/bin/ccsum"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
