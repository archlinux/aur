# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Grigory Kirillov <txgk@bk.ru>

pkgname=newsraft
pkgver=0.26
pkgrel=1
pkgdesc='Feed reader with ncurses user interface'
url='https://codeberg.org/newsraft/newsraft'
arch=('x86_64')
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
sha256sums=('4c96ecb5628a14b7acabff4645595326b079ca1a93c2b2cbbd1af03aef1b91ea')

prepare() {
  cd "${srcdir}/newsraft"
  sed -i 's/^CFLAGS/#CFLAGS/g'   makefile
  sed -i 's/^LDFLAGS/#LDFLAGS/g' makefile
}

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
