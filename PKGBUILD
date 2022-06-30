# Maintainer: Grigory Kirillov <txgk@bk.ru>
pkgname=newsraft
pkgver=0.3
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
sha256sums=('6c8551fbba2a37c62fc99f19b71d3e375fe904b8b93c659a193c55d98e4f33e3')

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
