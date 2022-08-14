# Maintainer: Grigory Kirillov <txgk@bk.ru>
pkgname=newsraft
pkgver=0.8
pkgrel=0
pkgdesc='Feed reader with ncurses user interface'
url='https://codeberg.org/grisha/newsraft'
#arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
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
sha256sums=('c0e6506257c877a80fc3e1f0d0cc1b04a5b439879232355bf50231850b5ebd42')

build() {
	cd "$srcdir"/newsraft
	make all
}

package() {
	cd "$srcdir"/newsraft
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 doc/license.txt -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
