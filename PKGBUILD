# Maintainer: Sematre <sematre at gmx dot de>
pkgname=typos
pkgver=1.6.0
pkgrel=1

pkgdesc="Source code spell checker."
arch=('any')
url="https://github.com/crate-ci/${pkgname}"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dae573fd03ae93d63f87d3f0a5acdb0994d793897354061600826f532299bc4e')

prepare() {
	cd "${pkgname}-${pkgver}"
	cargo fetch --locked
}

build() {
	cd "${pkgname}-${pkgver}"
	cargo build --release --frozen
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm644 "LICENSE-MIT"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
