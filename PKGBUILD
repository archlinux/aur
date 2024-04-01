# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Grigory Kirillov <txgk@bk.ru>

pkgname=newsraft
pkgver=0.24
pkgrel=1
pkgdesc='Feed reader with ncurses user interface'
url='https://codeberg.org/newsraft/newsraft'
arch=('any')
license=('ISC')
depends=(
	'ncurses'
	'sqlite'
	'curl'
	'expat'
	'yajl'
	'gumbo-parser'
	)
source=("https://codeberg.org/newsraft/newsraft/archive/newsraft-${pkgver}.tar.gz")
sha256sums=('1bc072350cee8960880cef0f749922c9474d91c9df467a0645b1632fbddb48f5')

build() {
	cd "${srcdir}"/newsraft
	make
}

check() {
	cd "${srcdir}"/newsraft
	./newsraft -v
}

package() {
	cd "${srcdir}"/newsraft
	make DESTDIR="${pkgdir}" PREFIX=/usr install
	install -Dm644 doc/license.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/license.txt
}
