# Maintainer: Kevin Wheelans <kevin dot wheelans at proton dot me>

pkgname="pass-it-on-cli"
pkgver=0.4.0
pkgrel=1
pkgdesc="Pass-it-on-cli client"
arch=("any")
license=("MIT")
url="https://github.com/kwheelans/pass-it-on-cli"
depends=("openssl")
makedepends=("cargo")
source=("https://github.com/kwheelans/pass-it-on-cli/releases/download/v$pkgver/pass-it-on-cli-v$pkgver.tar.gz")
b2sums=('5aed3994ba78ff63a12ce5b480e98f96857d50f99f2dc42abbb48ac60989576f19d473757d003503a3703c0b1ee40ec331e06ee63334fcb37075cafa4acec48e')

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
