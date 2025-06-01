# Maintainer: Leah Anderson <leah.anderson4435@proton.me>
pkgname=theclicker
pkgver=0.2.2
pkgrel=1
pkgdesc="Autoclicker coded in Rust for Wayland and X11"
arch=('x86_64')
url="https://crates.io/crates/theclicker"
license=('MIT')
depends=('gcc-libs' 'openssl' 'libxcb')
makedepends=('cargo' 'python')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('4166c237fa9189e36bfade5d7a38040b4ee8cf12349e701300f177ee9723d60202bddb41f00a36d8abbdfeff6f5f5caaac390194002c11e81f2b20ee0764142e')

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
  	export CARGO_TARGET_DIR=target
  	cargo build --release
	
}
check() {
	cd "$pkgname-$pkgver"
  	export RUSTUP_TOOLCHAIN=stable
  	cargo test
}

package() {
	install -Dm 755 "$srcdir/$pkgname-$pkgver/target/release/theclicker" -t "$pkgdir/usr/bin"
 	install -Dm 644 "$srcdir/$pkgname-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
 	install -Dm 644 "$srcdir/$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
