# Maintainer: autinerd <autinerd-arch at kuyateh dot eu>

pkgname=arcticons-icon-theme
pkgver=7.1.6
pkgrel=1
pkgdesc='A monotone line-based icon pack for android - freedesktop version'
arch=('any')
optdepends=('inkscape: for generationg the symbolic icons')
url='https://github.com/Donnnno/Arcticons'
license=('GPL3')
options=(!strip)
provides=('arcticons-icon-theme')
conflicts=('arcticons-icon-theme')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('a5935d9774608047110a9a66d5e566dbe9b021070f994925af86d65c43e6210dee56ec87367650988033d5323885190be62535a59328d64be3cebaf48d725d45')

build() {
	cd "$srcdir/Arcticons-${pkgver}/freedesktop-theme"
	./generate.sh white 2
	mv arcticons arcticons-dark
	./generate.sh black 2
	mv arcticons arcticons-light
	rm arcticons.tar.gz
}

package() {
	cd "$srcdir/Arcticons-${pkgver}/freedesktop-theme"
	install -d "$pkgdir/usr/share/icons"
	cp -r arcticons-light arcticons-dark "$pkgdir/usr/share/icons"
	cd "$srcdir/Arcticons-${pkgver}"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
