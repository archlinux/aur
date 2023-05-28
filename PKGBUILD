#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>

pkgname=rgb.txt
pkgver="1.0"
pkgrel=1
pkgdesc="Vim's old rgb.txt (needed by vimcat)"
arch=(any)
url="https://github.com/ctrlcctrlv/rgb.txt"
license=(custom:vim)
depends=(vim)
source=("rgb-$pkgver-$pkgrel.txt::https://github.com/ctrlcctrlv/rgb.txt/releases/download/v1.0/rgb.txt"
        "rgb-$pkgver-$pkgrel.txt.sig::https://github.com/ctrlcctrlv/rgb.txt/releases/download/v1.0/rgb.txt.sig")
sha256sums=('582888d4e7247a9a7d3acf0a79a63823c438faea8f686a338610a563d35bf2d7'
            'SKIP')
validpgpkeys=(98F28F767470129FBE3B054CE2154DD1A1C77B8B)

package() {
	install -Dm644 "$srcdir/rgb-$pkgver-$pkgrel.txt" "$pkgdir/usr/share/rgb.txt/rgb.txt"	
	shopt -s extglob
	for f in `echo /usr/share/vim/vim+([[:digit:]])`; do
		mkdir -p "$pkgdir$f"
		ln -s "$pkgdir/usr/share/rgb.txt/rgb.txt" "$pkgdir$f/rgb.txt"
	done
	mkdir -p "$pkgdir/usr/share/licenses/rgb.txt/"
	ln -s /usr/share/licenses/vim/license.txt "$pkgdir/usr/share/licenses/rgb.txt/license.txt"
}
