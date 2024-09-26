# Maintainer: Kevin Wheelans <kevin dot wheelans at proton dot me>

pkgname="pass-it-on-cli"
pkgver=0.6.0
pkgrel=2
pkgdesc="Pass-it-on-cli client"
arch=("any")
license=("MIT")
url="https://github.com/kwheelans/pass-it-on-cli"
depends=("openssl")
makedepends=("cargo")
options=("!lto")
source=("https://github.com/kwheelans/pass-it-on-cli/releases/download/v$pkgver/pass-it-on-cli-v$pkgver.tar.gz")
b2sums=('f62824f182b6f582a21fdb8efcd6b3440d276c2ee864d5b78a87d6a4f4f4fcfd960ca1d1e9506f060b4249aacb3979bdd0d561eb1d4c7a5143fecae5690a0e5b')

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
