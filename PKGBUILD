# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=goplus
pkgname=xgo
pkgver=1.5.0
pkgrel=1
pkgdesc='The first AI-native programming language that integrates software engineering into a unified whole'
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('Apache-2.0')

provides=("${pkgname}")
conflicts=('goplus')
replaces=('goplus')
makedepends=('go')

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e7d80a6760f794ffb4f30c89097b8903f8a1e8c6b60706673d88bcdc304f05c8')

build() {
	export GOPROOT_FINAL=$pkgdir/usr/lib/xgo

	cd xgo-$pkgver

	go run cmd/make.go --install
}

package() {
	cd xgo-$pkgver

	mkdir -p $pkgdir/usr/{bin,lib/xgo}
	cp -r * $pkgdir/usr/lib/xgo

	for f in bin/*; do
		ln -s /usr/lib/xgo/bin/$(basename "$f") $pkgdir/usr/bin/
	done
}
