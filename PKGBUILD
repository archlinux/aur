# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: beest <gnubeest@gmail.com>

pkgname=duc
pkgver=1.4.1
pkgrel=1
pkgdesc="A library and suite of tools for inspecting disk usage."
arch=('i686' 'x86_64')
url="http://duc.zevv.nl/"
license=('GPL2')
depends=('cairo' 'pango' 'leveldb' 'ncurses')
source=("https://github.com/zevv/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
	'ncursesw.patch')

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

md5sums=('c2108ef00f20784a9401ae95550adf2e'
         'a43e8bafaa9e16266e3d8d4a7f602df6')
sha1sums=('c177ffe483522c9700c2ca2508d19b2c7ea6374d'
          '6633e6dbfab7e00cc659b6210379afb9166384f1')
sha256sums=('04c75ea1cb3ce2d66c5628d999eae2accf66f56b74a9a6879dc8ffb8c9d66bf3'
            '8f927a37cf749fa6f279cc4c74dd82d5d7932901e8e86265309121785fd6cb14')
