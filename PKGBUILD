# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Grigory Kirillov <txgk@bk.ru>

pkgname=newsraft
pkgver=0.37
pkgrel=1
pkgdesc='Feed reader with text-based user interface'
url='https://codeberg.org/newsraft/newsraft'
arch=('x86_64')
license=('ISC')
depends=(
	'sqlite'
	'curl'
	'expat'
	'gumbo-parser'
	)
source=("https://codeberg.org/newsraft/newsraft/archive/newsraft-${pkgver}.tar.gz")
sha256sums=('725fdbf4c14d87eb7e926aebd9b116f540dca812bea02e73078070156d986ad4')

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
