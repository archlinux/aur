# Maintainer: Forest Ames <fox dot ames at smallfox dot io>
pkgname=nbtcon
pkgver=0.1.0
pkgrel=1
pkgdesc="Convert between NBT and other formats."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/FoxAmes/nbtcon"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("https://gitlab.com/FoxAmes/${pkgname}/-/archive/v${pkgver}/${pkgname}-v$pkgver.tar.gz")
sha256sums=('01965d2d8709cd71e0097163cd2f85bb83766ac3273bfc16bec4e36ce02df1fd')

prepare() {
	cd "$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
	cd "$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features --lib --bins --tests
}

package() {
	cd "$pkgname-v$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}"
}
