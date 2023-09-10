pkgname=angry-purple-tiger-rs
pkgver=1.0.0
pkgrel=1
pkgdesc="Human-readable three-word animal-based hash digest tool (rust version)"
arch=(x86_64)
url='https://github.com/helium/angry-purple-tiger-rs'
license=(Apache-2.0)
depends=()
makedepends=(cargo)
source=(https://github.com/helium/angry-purple-tiger-rs/archive/refs/tags/v"$pkgver".tar.gz)
sha256sums=(1c9efa1b7683e96b319b7b90b616f2347100aff65fd73fbdf86e4408653c5a49)

prepare() {
	cd "${pkgname}-${pkgver}"
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm0755 -t "$pkgdir/usr/bin/" target/release/angry_purple_tiger
}
