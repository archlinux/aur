# Maintainer: Kimiblock Moe

pkgname=anti-spam-matrix-git
pkgdesc="This is a simple Matrix spam banning bot."
url="https://github.com/poly000/anti-spam-matrix"
license=("MIT")
arch=("any")
pkgver=r9.a3997e5
pkgrel=1
makedepends=("rust" "cargo" "git")
depends=()
source=("git+https://github.com/poly000/anti-spam-matrix.git")
md5sums=("SKIP")
provides=("anti-spam-matrix")
conflicts=("anti-spam-matrix")

function pkgver() {
	cd "${srcdir}/anti-spam-matrix"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	#git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function prepare() {
	cd "${srcdir}/anti-spam-matrix"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

function build() {
	cd "${srcdir}/anti-spam-matrix"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features --locked
}

function check() {
	cd "${srcdir}/anti-spam-matrix"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

function package() {
	install -Dm755 "${srcdir}/anti-spam-matrix/target/release/anti-spam-matrix" "${pkgdir}/usr/bin/anti-spam-matrix"
}



