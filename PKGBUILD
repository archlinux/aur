# Maintainer: Grigory Kirillov <txgk@bk.ru>
pkgname=newsraft
pkgver=0.13
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
sha256sums=('7dc7f5df3e8c929509acc96a1a658d5b9e4f1cfdc84663d5d356116542191edc')

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
