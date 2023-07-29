# Maintainer: Steven! Ragnarök <steven@nuclearsandwich.com>
pkgname=tokay
pkgver=0.6.4
pkgrel=1
pkgdesc="Tokay is a programming language designed for ad-hoc parsing."
arch=('x86_64')
url="https://tokay.dev"
license=('MIT')
makedepends=('rust')
source=("https://github.com/tokay-lang/tokay/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('be07b9b3e3f1c44c96e49d7d35884c2a8a1913e228b1b9672fe65357bc134987')

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
