# Maintainer: Sematre <sematre at gmx dot de>
pkgname=cargo-deb
pkgver=1.30.0
pkgrel=1

pkgdesc="Cargo subcommand that generates Debian packages."
arch=('any')
url="https://github.com/mmstick/${pkgname}"
license=('MIT')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('724e69fe9dbc9ec6bd8c2c00ce289966c39822e80648463acb2eb76c2a0bd2f0')

build() {
	cd "${pkgname}-${pkgver}"
	cargo build --release --locked
}

package() {
	cd "${pkgname}-${pkgver}"
	cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --path .
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
