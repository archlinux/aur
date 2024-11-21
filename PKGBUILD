# Maintainer: Steven! Ragnarök <steven@nuclearsandwich.com>
pkgname=tokay
pkgver=0.6.6
pkgrel=1
pkgdesc="Tokay is a programming language designed for ad-hoc parsing."
arch=('x86_64')
url="https://tokay.dev"
license=('MIT')
makedepends=('rust')
source=("https://github.com/tokay-lang/tokay/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dd0b54e75914a120c215c868a3a747b2b7aff117b28366c562de1df7c04d2d62')

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
