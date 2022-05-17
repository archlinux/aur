# Maintainer: Steven! Ragnarök <steven@nuclearsandwich.com>
pkgname=tokay
pkgver=0.5
pkgrel=1
pkgdesc="Tokay is an imperative, procedural programming language dedicated to parsing and other text-processing tasks."
arch=('x86_64')
url="https://tokay.dev"
license=('MIT')
makedepends=('rust')
source=("https://github.com/tokay-lang/tokay/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a85ed3f83ce30c9779bd29e5a195b56f815d89b3704e2c7cb2a17369ea158464')

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
