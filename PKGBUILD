# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=datavzrd
pkgver=2.59.1
pkgrel=1
pkgdesc="A tool to create visual HTML reports from collections of CSV/TSV tables"
arch=('x86_64')
url="https://github.com/datavzrd/datavzrd"
license=('MIT')
makedepends=(cargo)
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('33273144425227e86e4312e5612535cd4ef56b0c3f548b4ed857baae6d131481')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
