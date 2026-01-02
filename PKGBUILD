# Maintainer: Leah Anderson <leah.anderson4435@proton.me>
pkgname=theclicker
pkgver=0.3.0
pkgrel=1
pkgdesc="Autoclicker coded in Rust for Wayland and X11"
arch=('x86_64')
url="https://crates.io/crates/theclicker"
license=('MIT')
depends=('gcc-libs' 'openssl' 'libxcb')
makedepends=('cargo' 'python')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('a73842dee5a1e0122712ddaac2946628fc4a4e03154d5b54afd15b8515bf7e45a59328dca1057419db5a23a5202c07cf77b7468073d0ffdfe8e7aa7538db0690')

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
