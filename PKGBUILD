# Maintainer: Grigory Kirillov <txgk@bk.ru>
pkgname=newsraft
pkgver=0.2
pkgrel=0
pkgdesc='Feed reader with ncurses user interface'
arch=('x86_64')
url='https://codeberg.org/grisha/newsraft'
license=('MIT')
depends=(
	'ncurses'
	'sqlite'
	'curl'
	'expat'
	'yajl'
	'gumbo-parser'
	)
makedepends=('meson' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/grisha/newsraft/archive/$pkgver.tar.gz")
sha256sums=('ed605065644ec0ada0e96dd809946947ed8895febfb99a00ed8c2b69a54b3edb')

build() {
	cd "$srcdir/newsraft"
	sed -i '/cppcheck/d' meson.build
	arch-meson builddir
	meson compile ${JOBS:+-j ${JOBS}} -C builddir
}

package() {
	cd "$srcdir/newsraft"
	DESTDIR="$pkgdir" meson install -C builddir
	install -Dm644 doc/license.txt -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
