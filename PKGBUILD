# Maintainer: Sematre <sematre at gmx dot de>
pkgname=typos
pkgver=1.1.2
pkgrel=1

pkgdesc="Source code spell checker."
arch=('any')
url="https://github.com/crate-ci/${pkgname}"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2494ec30051c21356ea63f09b63c91fddbb6cdbc6f48d1d5fabfa6acbe82c7c4')

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
