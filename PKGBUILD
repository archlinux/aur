# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=jxl-oxide
pkgver=0.8.1
pkgrel=1
pkgdesc="Pure Rust implementation of JPEG XL decoder"
arch=('x86_64')
url="https://github.com/tirr-c/jxl-oxide"
license=('Apache-2.0 AND MIT')
depends=('glibc' 'gcc-libs' 'lcms2')
makedepends=('cargo')
provides=()
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7f412ffa507492cafd1f861150037b3e31decdcf4a6b53b4d37353defee1ded8')

prepare() {
	cd "$srcdir/$pkgname-$pkgver/crates/${pkgname}-cli"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname-$pkgver/crates/${pkgname}-cli"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname-$pkgver/crates/${pkgname}-cli"
	install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
