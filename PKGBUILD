# Maintainer: Grigory Kirillov <txgk@bk.ru>
pkgname=newsraft
pkgver=0.11
pkgrel=0
pkgdesc='Feed reader with ncurses user interface'
url='https://codeberg.org/grisha/newsraft'
arch=('any')
license=('MIT')
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
sha256sums=('37bb01dd46bda60cf3703d942646003f165448c4476e7c179354b5b042090344')

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
