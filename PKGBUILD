# Maintainer: beest <gnubeest@gmail.com>

pkgname=duc
pkgver=1.2
pkgrel=1
pkgdesc="A library and suite of tools for inspecting disk usage."
arch=('i686' 'x86_64')
url="http://duc.zevv.nl/"
license=('GPL2')
depends=('cairo' 'pango' 'tokyocabinet' 'ncurses')
source=("https://github.com/zevv/duc/releases/download/1.2/duc-1.2.tar.gz"
	'ncursesw.patch')

prepare() {
	patch "$srcdir/$pkgname-$pkgver"/src/duc/cmd-ui.c < "$srcdir"/ncursesw.patch
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
md5sums=('79dc929af0e81f108153e9f6b7cf3d1e'
         '2c6f027ff9b42e16718fc2340f12702e')
