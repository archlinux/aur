# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=paper-age
pkgver=1.5.0
pkgrel=1
pkgdesc="Easy and secure paper backups of secrets via encrypted QR code"
arch=('x86_64')
url="https://github.com/matiaskorhonen/paper-age"
license=('MIT')
depends=()
makedepends=('cargo')
_tag="v1.5.0"
_srcdir="paper-age-1.5.0"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/matiaskorhonen/paper-age/tar.gz/refs/tags/$_tag")
sha256sums=('bc374b5c3fe18505102af903be3ce72c01c8d2f9a992fd7320a25fea163886e7')

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked
}

package() {
	cd "$_srcdir"
	install -Dm755 "target/release/paper-age" "$pkgdir/usr/bin/paper-age"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
