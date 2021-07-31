# Maintainer: Sematre <sematre at gmx dot de>
pkgname=typos
pkgver=1.1.3
pkgrel=1

pkgdesc="Source code spell checker."
arch=('any')
url="https://github.com/crate-ci/${pkgname}"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4ae2fb3376e7dfc3281879a08ddeec53d0d51913807eae00d73993c50141af56')

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
