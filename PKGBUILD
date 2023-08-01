# Contributor: Grigory Kirillov <txgk@bk.ru>
# Maintainer:
pkgname=newsraft
pkgver=0.19
pkgrel=0
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
makedepends=('scdoc')
source=("https://codeberg.org/grisha/newsraft/archive/newsraft-$pkgver.tar.gz")
sha256sums=('6f7b578609f543f65b63dc0ba2fd904cc7b71d4f33f84ef052fe704c5156b605')

build() {
	cd "$srcdir"/newsraft
	make
}

check() {
	cd "$srcdir"/newsraft
	./newsraft -v
}

package() {
	cd "$srcdir"/newsraft
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 doc/license.txt "$pkgdir"/usr/share/licenses/"$pkgname"/license.txt
}
