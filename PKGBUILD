# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Grigory Kirillov <txgk@bk.ru>

pkgname=newsraft
pkgver=0.31
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
	'gumbo-parser'
	)
source=("https://codeberg.org/newsraft/newsraft/archive/newsraft-${pkgver}.tar.gz")
sha256sums=('de0d96664d9a276dbe58cf4b44a6861bc18b6fd4c0f41a97450c5b3509904ae8')

#prepare() {
#  cd "${srcdir}/newsraft"
#  sed -i 's/^CFLAGS/#CFLAGS/g'   makefile
#  sed -i 's/^LDFLAGS/#LDFLAGS/g' makefile
#}

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
	make DESTDIR="${pkgdir}" PREFIX=/usr install EXAMPLES_DIR=/usr/share/doc/newsraft/example
	make DESTDIR="${pkgdir}" PREFIX=/usr install-desktop
	install -Dm644 doc/changes.md "${pkgdir}"/usr/share/doc/"${pkgname}"/changes.md
}
