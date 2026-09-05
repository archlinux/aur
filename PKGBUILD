# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=hburger
pkgver=0.2.0
pkgrel=1
pkgdesc="Shorten long strings and paths while preserving readability"
arch=('x86_64')
url="https://github.com/niqodea/hburger"
license=('MIT')
depends=()
makedepends=('cargo')
_tag="v0.2.0"
_srcdir="hburger-0.2.0"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/niqodea/hburger/tar.gz/refs/tags/$_tag")
sha256sums=('9e3bc9c9bc19c509bb286a563036a24814aeac92e809e5374eef6ddf5ee34a45')

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked
}

package() {
	cd "$_srcdir"
	install -Dm755 "target/release/hburger" "$pkgdir/usr/bin/hburger"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
