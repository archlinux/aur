# Maintainer: Grigory Kirillov <txgk@bk.ru>
pkgname=newsraft
pkgver=0.6
pkgrel=0
pkgdesc='Feed reader with ncurses user interface'
url='https://codeberg.org/grisha/newsraft'
arch=('x86_64')
license=('MIT')
depends=(
	'ncurses'
	'sqlite'
	'curl'
	'expat'
	'yajl'
	'gumbo-parser'
	)
makedepends=(
	'meson'
	'scdoc'
	)
source=("https://codeberg.org/grisha/newsraft/archive/newsraft-$pkgver.tar.gz")
sha256sums=('cc7ee3238eb4a2c7eb32249504677037b57a7c8bba93b7d7762e5e4c6808254d')

build() {
	cd "$srcdir/newsraft"
	arch-meson builddir
	meson compile ${JOBS:+-j ${JOBS}} -C builddir
}

package() {
	cd "$srcdir/newsraft"
	DESTDIR="$pkgdir" meson install -C builddir
	install -Dm644 doc/license.txt -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
