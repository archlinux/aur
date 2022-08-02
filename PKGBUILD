# Maintainer: Grigory Kirillov <txgk@bk.ru>
pkgname=newsraft
pkgver=0.7
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
sha256sums=('9a8d4059672d904827b14bc171de32962a1ee5ebedcf5f3c3461a07512559f95')

build() {
	cd "$srcdir"/newsraft
	make all
}

package() {
	cd "$srcdir"/newsraft
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 doc/license.txt -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
