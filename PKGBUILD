pkgname=synapse-bt
_name=synapse
pkgver=1.0.0
pkgrel=1
pkgdesc="A flexible and fast BitTorrent daemon."
arch=(x86_64)
license=(ISC)
depends=()
makedepends=(cargo)
_archive="$_name-1.0"
source=("$_archive.tar.gz::https://github.com/Luminarys/synapse/archive/refs/tags/1.0.tar.gz")
sha256sums=('e14573bc36e6b54c4091dc7b790775a7ffa3f433ee098984a0be6a4007c0da1f')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	local RUSTUP_TOOLCHAIN=stable
	local CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/synapse"
}
