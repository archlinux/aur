# Maintainer: Grigory Kirillov <txgk@bk.ru>
pkgname=newsraft
pkgver=0.15
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
sha256sums=('9c853c923a2e0576b2319e6fcc1c895d97d7472231696646c0099c386b07cca8')

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
