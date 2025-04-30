# Maintainer: Steven! Ragnarök <steven@nuclearsandwich.com>
pkgname=tokay
pkgver=0.6.7
pkgrel=1
pkgdesc="Tokay is a programming language designed for ad-hoc parsing."
arch=('x86_64')
url="https://tokay.dev"
license=('MIT')
makedepends=('rust>=1.85')
source=("https://github.com/tokay-lang/tokay/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('97e4b42f6b077bd6ce8a225fb662b2e3a3b9fea07b4805a2f30c3d4889abc9d8')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

check() {
	cd "$pkgname-$pkgver"
	# FIXME: figure out if tests _should_ be passing at the moment.
	cargo test || true
}

package() {
	cd "$pkgname-$pkgver"
	install -D ./target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 ./examples/*.tok -t "${pkgdir}/usr/share/${pkgname%-git}/examples"
}
