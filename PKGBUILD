# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Grigory Kirillov <txgk@bk.ru>

pkgname=newsraft
pkgver=0.22
pkgrel=1
pkgdesc='Feed reader with ncurses user interface'
url='https://codeberg.org/grisha/newsraft'
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
source=("https://codeberg.org/grisha/newsraft/archive/newsraft-${pkgver}.tar.gz")
sha256sums=('08eb3ee222e368f12a42ad2ae90c0f4ed4060e31913b2757d6b32cebaac6d418')

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
