# Maintainer: pigt <pay2630 at gmail dot com>
pkgname=todour
pkgver=2.152
pkgrel=1
pkgdesc="An application for handling todo.txt files."
arch=('x86_64')
url="https://nerdur.com/todour-pl/"
license=('GPL')
depends=(qt5-base)
source=("git+https://github.com/SverrirValgeirsson/Todour.git?tag=v$pkgver", 'todour.desktop')
md5sums=('SKIP'
         '1c2c52be2c88a64ad58d8ac935b08aae')

prepare() {
	cd Todour
	git submodule init
	git submodule update
}

build() {
	cd Todour
	qmake-qt5
	make
}

package() {
	mkdir -p $pkgdir/usr/bin/
	install -m 755 Todour/Todour $pkgdir/usr/bin/todour

	mkdir -p $pkgdir/usr/share/applications
	install -m 755 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
