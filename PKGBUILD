# Maintainer: Kevin Wheelans <kevin dot wheelans at proton dot me>

pkgname="pass-it-on-cli"
pkgver=0.6.2
pkgrel=1
pkgdesc="Pass-it-on-cli client"
arch=("any")
license=("MIT")
url="https://github.com/kwheelans/pass-it-on-cli"
depends=()
makedepends=("cargo")
options=("!lto")
source=("https://github.com/kwheelans/pass-it-on-cli/releases/download/v$pkgver/pass-it-on-cli-v$pkgver.tar.gz")
b2sums=('c308382ef4d13ca51853fd26766075d97b766016a6c4e4cf51fae92969412928fd1a881f3ebcd2e95910e5bbaaac059c8d6372b1f598fc6add3297e4edd81e01')

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
