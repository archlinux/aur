# Maintainer: Kaleb Klein <klein.jae@gmail.com>

_base=checkmate
pkgname=${_base}-git
pkgver=2.4
pkgrel=10
pkgdesc="GUI application for verifying and generating checksums"
arch=(any)
license=('LGPL')
url="http://github.com/pazuzu156/${_base}"
depends=('qt5-base')
makedepends=('git')
source=("${_base}::git+$url.git#tag=v$pkgver")
validpgpkeys=(120206848BD3375043BF1B253209FA22E33FF70C)
sha256sums=('SKIP')

build() {
	cd $srcdir/${_base}
	qmake-qt5 src/Checkmate.pro -o src/Makefile
	make -C src
}

package() {
	cd "$srcdir/checkmate"

	install -D -m755 "$srcdir/${_base}/src/Checkmate" "$pkgdir/usr/bin/${_base}"
	install -D -m644 "$srcdir/${_base}/${_base}.desktop" "$pkgdir/usr/share/applications/${_base}.desktop"
	install -D -m644 "$srcdir/${_base}/src/res/images/gear.png" "$pkgdir/usr/share/icons/${_base}_icon.png"
}
