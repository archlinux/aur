# Maintainer: Grigory Kirillov <txgk@bk.ru>
pkgname=newsraft
pkgver=0.4
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
sha256sums=('a13f62c0c57635d6ad507c04b3ae4fde04b13f78da8b08972c7d01c23cb0bc18')

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
