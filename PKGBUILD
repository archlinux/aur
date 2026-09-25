# Maintainer: jackssrt <jack at jackssrt dot com>
pkgname="loago"
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Track how long ago you last did a task"
arch=("any")
url="https://github.com/Axlefublr/loago"
license=("MIT")
depends=()
makedepends=(cargo)
checkdepends=()
optdepends=()

source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("bec1e1384800dab713f35fd6d3f1979b78e582b8456f7aa4deec447308166b5a")

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_HOME="$startdir/$srcdir/.cargo"
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_HOME="$startdir/$srcdir/.cargo"
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/loago"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
