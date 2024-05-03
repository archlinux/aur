# Maintainer: Kimiblock Moe

pkgname=conduwuit
pkgdesc="a very cool, featureful fork of conduit"
url="https://github.com/girlbossceo/conduwuit"
license=("Apache-2.0")
arch=("any")
pkgver=0.3.1
pkgrel=1
makedepends=("rust" "cargo" "git")
depends=("gcc-libs" "glibc" "liburing")
source=("git+https://github.com/girlbossceo/conduwuit#tag=v${pkgver}")
md5sums=("SKIP")
provides=("conduwuit")
options=(!lto)

function prepare() {
	cd "${srcdir}/conduwuit"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

function build() {
	cd "${srcdir}/conduwuit"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-features --locked
}

function check() {
	cd "${srcdir}/conduwuit"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --release --frozen --all-features --locked
}

function package() {
	install -Dm755 "${srcdir}/conduwuit/target/release/conduit" "${pkgdir}/usr/bin/conduwuit"
	install -Dm644 "${srcdir}/conduwuit/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

