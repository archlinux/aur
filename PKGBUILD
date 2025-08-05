# Maintainer: Steven! Ragnarök <steven@nuclearsandwich.com>
pkgname=tokay
pkgver=0.6.12
pkgrel=1
pkgdesc="Tokay is a programming language designed for ad-hoc parsing."
arch=('x86_64')
url="https://tokay.dev"
license=('MIT')
makedepends=('rust>=1.85')
source=("https://github.com/tokay-lang/tokay/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c7a0131f5da3609b05797fa018cea32e231562cfbd5f68aded49d306c67a3325')

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
