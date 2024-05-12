# Maintainer: Kimiblock Moe

pkgname=clash-rs
pkgdesc="custom protocol network proxy"
url="https://github.com/Watfaq/clash-rs"
license=("Apache-2.0")
arch=("any")
pkgver=0.1.17
pkgrel=1
makedepends=("rust" "cargo" "git")
depends=("gcc-libs" "glibc" "xz")
source=("git+https://github.com/Watfaq/clash-rs.git#tag=v${pkgver}")
md5sums=("SKIP")
provides=("clash-rs")
options=(!lto)

function prepare() {
	cd "${srcdir}/clash-rs"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

function build() {
	cd "${srcdir}/clash-rs"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-features --locked
}

function check() {
	cd "${srcdir}/clash-rs"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --release --frozen --all-features --locked
}

function package() {
	install -Dm755 "${srcdir}/clash-rs/target/release/clash" "${pkgdir}/usr/bin/clash-rs"
	install -Dm644 "${srcdir}/clash-rs/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

