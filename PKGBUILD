# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=tidy-viewer
_pkgname=tv
pkgver=0.0.21
pkgrel=1
pkgdesc="CLI csv pretty printer that uses column styling"
arch=('x86_64')
url="https://github.com/alexhallam/tv"
license=('Unlicense')
makedepends=('cargo')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('bee01aa9b07a9ec45f6a88f64b515d1eb88933d0bbb43de23452a434f00a0bae')

prepare() {
	cd "$_pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 "$srcdir/$_pkgname-$pkgver/UNLICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
