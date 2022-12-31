# Maintainer: Grigory Kirillov <txgk@bk.ru>
pkgname=newsraft
pkgver=0.14
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
sha256sums=('2c55bede1184e871bb4e4afd534371933ab276401ce8d78228fbe5220dd53ed7')

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
