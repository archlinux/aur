# Maintainer: Kevin Wheelans <kevin dot wheelans at proton dot me>

pkgname="pass-it-on-cli"
pkgver=0.5.0
pkgrel=1
pkgdesc="Pass-it-on-cli client"
arch=("any")
license=("MIT")
url="https://github.com/kwheelans/pass-it-on-cli"
depends=("openssl")
makedepends=("cargo")
source=("https://github.com/kwheelans/pass-it-on-cli/releases/download/v$pkgver/pass-it-on-cli-v$pkgver.tar.gz")
b2sums=('4302f44e74ea83d07ddffabe59b3d4c455bacaecdc36f5a453e7c57d3b197f2aaef556078012fd9ca543662f66da8e48fe655525388320f356a9ca4e8dadb6e4')

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
