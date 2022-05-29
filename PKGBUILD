# Maintainer: Sematre <sematre at gmx dot de>
pkgname=cargo-deb
pkgver=1.38.0
pkgrel=1

pkgdesc="Cargo subcommand that generates Debian packages."
arch=('any')
url="https://github.com/kornelski/${pkgname}"
license=('MIT')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7965b20e026269759dbf17b3a92b219b6948243121928296e945d619472fa730')

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
