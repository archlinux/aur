# Maintainer: Grigory Kirillov <txgk@bk.ru>
pkgname=newsraft
pkgver=0.5
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
sha256sums=('53896c63d36ef8dd50132834bd2105ee897c12b22d9c486a4e3cb0112c3ab4e4')

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
