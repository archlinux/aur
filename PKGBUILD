# Maintainer: jamnor <software AT vncompat DOT org> 
# Contributor: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Grigory Kirillov <txgk@bk.ru>

pkgname=newsraft-git
pkgver=0.22.13b98fb5e7
pkgrel=1
pkgdesc='Feed reader with ncurses user interface'
url='https://codeberg.org/newsraft/newsraft'
arch=('any')
license=('ISC')
makedepends=('git')
depends=(
	'ncurses'
	'sqlite'
	'curl'
	'expat'
	'yajl'
	'gumbo-parser'
	)
provides=(newsraft)
conflicts=(newsraft)
source=(git+$url.git)
sha256sums=('SKIP')

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
