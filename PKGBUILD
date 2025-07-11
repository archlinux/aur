# Maintainer: Kimiblock Moe

pkgname=jwt-service-rs-git
pkgdesc="JWT service for Element Call"
url="https://github.com/JadedBlueEyes/jwt-service-rs"
license=("unknown")
arch=("x86_64" "aarch64")
pkgver=0.2.3
pkgrel=1
makedepends=("rust" "cargo" "git")
depends=("gcc-libs" "glibc")
source=("git+https://github.com/JadedBlueEyes/jwt-service-rs.git")
md5sums=('SKIP')
conflicts=(jwt-service-rs)
provides=("jwt-service-rs")
options=(!lto)

function prepare() {
	cd "${srcdir}/jwt-service-rs"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

function build() {
	cd "${srcdir}/jwt-service-rs"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-features --locked
}

function check() {
	cd "${srcdir}/jwt-service-rs"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --release --frozen --all-features --locked
}

function package() {
	install -Dm755 "${srcdir}/jwt-service-rs/target/release/jwt_service_cli" "${pkgdir}/usr/bin/jwt_service_cli"
	#install -Dm644 "${srcdir}/jwt-service-rs/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	#install -d "${pkgdir}/usr/share/jwt-service-rs"
	#cp 
}
