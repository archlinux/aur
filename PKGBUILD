# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=mlc
pkgname=markuplinkchecker
pkgver=0.16.3
pkgrel=1
pkgdesc="Check for broken links in markup files"
arch=('x86_64')
url='https://github.com/becheran/mlc'
license=('MIT')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$_name/$_name-$pkgver.crate")
b2sums=('e7b47934932147aec823cdf23a39e500c40628b011becbf6af799e7041fbdab27d5952b4f04c0aaf822715fcd5dc64ab373d88bbe967ce16bd6e3ade5c591b7d')

prepare() {
	cd $_name-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd $_name-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd $_name-$pkgver
	install -Dm0755 -t "$pkgdir/usr/bin/" target/release/$_name
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
