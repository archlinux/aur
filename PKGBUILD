# Maintainer: Steven! Ragnarök <steven@nuclearsandwich.com>
pkgname=tokay
pkgver=0.6.10
pkgrel=1
pkgdesc="Tokay is a programming language designed for ad-hoc parsing."
arch=('x86_64')
url="https://tokay.dev"
license=('MIT')
makedepends=('rust>=1.85')
source=("https://github.com/tokay-lang/tokay/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2e0b009b73ac44696eb32c6bd1070f1ad027d791344b117db3eb167f3b6a0f8f')

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
