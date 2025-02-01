# Maintainer: Kimiblock Moe

pkgname=clash-rs
pkgdesc="custom protocol network proxy"
url="https://github.com/Watfaq/clash-rs"
license=("Apache-2.0")
arch=("any")
pkgver=0.7.4
pkgrel=1
makedepends=("cargo-nightly" "git")
depends=("gcc-libs" "glibc" "xz" "protobuf")
source=("git+https://github.com/Watfaq/clash-rs.git#tag=v${pkgver}")
sha256sums=('ed68b1760adce8ce4f6c7982af17095d47b3bbf40367d92f0e439fc2756d8703')
provides=("clash-rs")
options=(!lto)

function prepare() {
	cd "${srcdir}/clash-rs"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

function build() {
	cd "${srcdir}/clash-rs"
	#export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-features --locked
}

function package() {
	install -Dm755 "${srcdir}/clash-rs/target/release/clash-rs" "${pkgdir}/usr/bin/clash-rs"
	install -Dm644 "${srcdir}/clash-rs/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

