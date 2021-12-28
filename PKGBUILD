# Maintainer: Sematre <sematre at gmx dot de>
pkgname=cargo-deb
pkgver=1.34.0
pkgrel=1

pkgdesc="Cargo subcommand that generates Debian packages."
arch=('any')
url="https://github.com/kornelski/${pkgname}"
license=('MIT')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7590998debeaf61df2df5f25d44db529b4ccfdbafe81147e5ccd760d0c996113')

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
