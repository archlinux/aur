# Maintainer: Paweł Lidwin <linguin@tutanota.com>

pkgname=jelly-desktop
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple community made desktop client for Jellyfin"
arch=(x86_64)
url="https://github.com/imLinguin/jelly-desktop"
license=(GPL3)
makedepends=(nodejs npm)
source=("git+https://github.com/imLinguin/jelly-desktop.git#tag=${pkgver}")
sha256sums=("SKIP")

build() {
	cd "jelly-desktop"
	npm install
	npm run build:ts
	npm run build:aur
}

package(){
	tar -xJv -C "${pkgdir}" -f "${srcdir}/jelly-desktop/dist/${_filename}" usr opt
	mkdir "$pkgdir/usr/bin"
	ln -s "/opt/Jelly Desktop/jelly-desktop" "$pkgdir/usr/bin/jelly-desktop"
}
