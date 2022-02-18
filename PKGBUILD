# Maintainer: Sematre <sematre at gmx dot de>
pkgname=cargo-deb
pkgver=1.36.0
pkgrel=1

pkgdesc="Cargo subcommand that generates Debian packages."
arch=('any')
url="https://github.com/kornelski/${pkgname}"
license=('MIT')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('786fc0ec130f0bb1fa37e7d884795d8a8d80ba361da6cc6d1e9a54dd4397ac88')

prepare() {
	cd "${pkgname}-${pkgver}"
	cargo fetch --locked
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-features
}

#check() {
#	cd "${srcdir}/${pkgname}-${pkgver}"
#
#	export RUSTUP_TOOLCHAIN=stable
#	cargo test --frozen --all-features
#}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
