# Maintainer: Kevin Wheelans <kevin dot wheelans at proton dot me>

pkgname="pass-it-on-cli"
pkgver=0.3.2
pkgrel=2
pkgdesc="Pass-it-on-cli client"
arch=("any")
license=("MIT")
url="https://github.com/kwheelans/pass-it-on-cli"
depends=("openssl")
makedepends=("cargo")
source=("https://github.com/kwheelans/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('c6861cd28b5bf0709316c9b71de834462bf440d09cad29856433aa9c9ed06ed4db5464feec6d53c1b64aa93a35cec72a95c0b45c32b667acf47aaf6fbd64f2b1')

prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --manifest-path $pkgname-$pkgver/Cargo.toml
}


build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --bins --release --manifest-path $pkgname-$pkgver/Cargo.toml
}


package() {
	install -Dm0755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
	
	# Package licenses
	install -Dm0644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
