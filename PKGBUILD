# Maintainer: qubidt <qubidt at gmail dot com>
# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=runiq
pkgver=2.0.0
pkgrel=1
pkgdesc="An efficient way to filter duplicate lines from input, à la uniq"
url="https://github.com/whitfin/runiq"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c08261db5349b607afcfc0d9c0630ef3cd0219ccd99cddf63cc7c06982cade5f')

prepare() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-features
}

check() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "target/release/${pkgname}" -t "${pkgdir}"/usr/bin
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
