# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Demir Yerli <mrquantumoff@protonmail.com>
pkgname=qfetch
pkgver=0.8.0
pkgrel=1
pkgdesc="A simple fetch tool written in rust"
arch=('x86_64')
url="https://github.com/mrquantumoff/qfetch"
license=('BSD-2-Clause')
makedepends=("rust")
provides=("qfetch")
source=("https://github.com/mrquantumoff/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0a6b2ebd064eba0ecaae5fd60ad0c74c5cdadc261c4d46167503fd27b31eacd3')

prepare() {
	cd "${pkgname}-${pkgver}"
	cargo clean
}

build() {
	cd "${pkgname}-${pkgver}"
	cargo build --release
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd "target/release"
	install -Dm755 -t "${pkgdir}/usr/bin/" qfetch
}
