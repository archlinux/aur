# Maintainer: iamawacko <iamawacko@protonmail.com>

pkgname=ruget
pkgver=0.5.0
pkgrel=1
arch=(any)
pkgdesc="Alternative to wget written in Rust"
url="https://github.com/ksk001100/ruget"
license=('MIT')
makedepends=(cargo)
source=("https://github.com/ksk001100/ruget/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('548c8f268646cd0101e977c6bfb02a668b9f10881033f4aceb4a05a2b5484590')

prepare() {
	cd "$pkgname-$pkgver"
	case $CARCH in
		"pentium4")
			cargo fetch --locked --target "i686-unknown-linux-gnu"
			;;
		*)
			cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
			;;
	esac
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

