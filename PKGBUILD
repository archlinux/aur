# Maintainer: Kevin Wheelans <kevin dot wheelans at proton dot me>

pkgname="pass-it-on-cli"
pkgver=0.4.1
pkgrel=1
pkgdesc="Pass-it-on-cli client"
arch=("any")
license=("MIT")
url="https://github.com/kwheelans/pass-it-on-cli"
depends=("openssl")
makedepends=("cargo")
source=("https://github.com/kwheelans/pass-it-on-cli/releases/download/v$pkgver/pass-it-on-cli-v$pkgver.tar.gz")
b2sums=('c1005fcc095200aa9da550f7376647e974fc3aaa52817cb1c755695b7dbaf37c10835a2ec2b70c135b39fba16f696024a310a13ea30f647130a7700810b7b73e')

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
