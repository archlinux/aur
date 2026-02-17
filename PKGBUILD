# Maintainer: Gabriel Bjørnager Jensen <gabriel at achernar dot io>

pkgname=plural2bin-git
pkgver=0.3.0
pkgrel=1
pkgdesc="Plural data recovery."
arch=("any")
url="https://mandelbrot.dk/bjoernager/plural2bin/"
license=("GPL-3.0-or-later")
makedepends=("git" "rustup")
provides=("plural2bin")
conflicts=("plural2bin")
source=("git+https://mandelbrot.dk/bjoernager/plural2bin.git")
sha512sums=("SKIP")

pkgver() {
	cd "${srcdir}/plural2bin"
	echo -n "$(git describe --abbrev=0)"
}

build() {
	cd "${srcdir}/plural2bin"
	cargo +nightly build --release --target-dir "target"
}

package() {
	cd "${srcdir}/plural2bin"

	mkdir -p "${pkgdir}/usr/bin"
	install -m755 "target/release/plural2bin" "${pkgdir}/usr/bin/plural2bin"
}
