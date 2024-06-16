# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname=lok
pkgver=0.2.5
pkgrel=2
url="https://github.com/wyhaya/lok"
license=('MIT')
pkgdesc="Count the number of codes"
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
makedepends=(cargo)
sha256sums=('525d74a8a47a8c7de981b5dbdf61b68f448ac6927c502e8cc37cc9468cdc02da')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
