# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: beest <gnubeest@gmail.com>
pkgname=duc
pkgver=1.4.4
pkgrel=1
pkgdesc="A library and suite of tools for inspecting disk usage."
arch=('i686' 'x86_64')
url="http://duc.zevv.nl/"
license=('GPL2')
depends=('cairo' 'pango' 'leveldb' 'ncurses')
source=(
  "https://github.com/zevv/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
  "https://github.com/zevv/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.asc"
	'ncursesw.patch')
validpgpkeys=(F042F5CDB0A6EC6ACB80A829CACDA4B54202FA2F)

prepare() {
	patch "$srcdir/$pkgname-$pkgver"/src/duc/cmd-ui.c < "$srcdir"/ncursesw.patch
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --with-db-backend=leveldb
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

sha512sums=('fe5b9c4bfa81c25ca09e4c5f89add50f17c4c345c7564569905b38dcf98eab327fae5a8ded44894a549de7913ee9c724dee42a3f8bb04e9e193e4d910c7733b1'
            'SKIP'
            '3b6bb894a9ee078976ea9c97d3cd840585f8622c87026aac681e7853a4603a3a0ea705376e328b9abfff2e5864433a13ce417fb53e290a00c1d619be5ec7a594')
