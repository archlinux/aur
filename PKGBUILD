# Maintainer: Sematre <sematre at gmx dot de>
pkgname=typos
pkgver=1.1.1
pkgrel=1

pkgdesc="Source code spell checker."
arch=('any')
url="https://github.com/crate-ci/${pkgname}"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0cfe10e120e133257b50256f5a9ad2ad1d5f575fab17f67390eebe1e757a9ea4')

build() {
	cd "${pkgname}-${pkgver}"
	cargo build --release --locked
}

package() {
	cd "${pkgname}-${pkgver}"
	cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --path .
	install -Dm 644 "LICENSE-MIT"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm 644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
