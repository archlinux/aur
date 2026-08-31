# Maintainer: konkitoman <open.issue.on@github.com>
# Contributor: Leah Anderson <leah.anderson4435@proton.me>
pkgname=theclicker
pkgver=0.4.0
pkgrel=1
pkgdesc="Autoclicker coded in Rust for Wayland and X11"
arch=('x86_64')
url="https://github.com/konkitoman/autoclicker"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('0b659da571da806c5ca269c594e9bc9398e1a6917bd852f6275f5df1c7915d9ca2a552f7ebaae499775d9769f3529aa6be882193bd1ebf4be33dbaa983770b02')
options=(!debug)
install="$pkgname.install"

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target $(rustc --print host-tuple)
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
	install -vDm 755 -t "$pkgdir/usr/bin/" target/release/theclicker
	install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -vDm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
