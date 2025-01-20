# Maintainer: Leah Anderson <leah.anderson4435@proton.me>
pkgname=theclicker
pkgver=0.2.1
pkgrel=1
pkgdesc="Autoclicker coded in Rust for Wayland and X11"
arch=('x86_64')
url="https://crates.io/crates/theclicker"
license=('MIT')
depends=('gcc-libs' 'openssl' 'libxcb')
makedepends=('cargo' 'python')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('14b4ddfd67614f564e37ec6c2cd8ad0db60a767a6574695b36647cdb3a183a475994d1c895a5dcb0a2b1c6935a93d946516923dd160ac3425f03b5b8d6dfb6b2')

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
