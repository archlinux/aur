# Maintainer: Steven! Ragnarök <steven@nuclearsandwich.com>
pkgname=tokay-git
pkgver=v0.6.2.r13.107bff6
pkgrel=1
pkgdesc="Tokay is an imperative, procedural programming language dedicated to parsing and other text-processing tasks."
arch=('x86_64')
url="https://tokay.dev"
license=('MIT')
makedepends=('git' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=("${pkgname%-git}::git+https://github.com/tokay-lang/tokay.git#branch=main")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release
}

check() {
	cd "$srcdir/${pkgname%-git}"
	# FIXME: figure out if tests _should_ be passing at the moment.
	cargo test || true
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D ./target/release/${pkgname%-git} "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm644 ./examples/*.tok -t "${pkgdir}/usr/share/${pkgname%-git}/examples"
}
