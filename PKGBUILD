# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: beest <gnubeest@gmail.com>

pkgname=duc
pkgver=1.4.2
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

md5sums=('f55c0d132cd46e15bafa7a1086e8658c'
         'a43e8bafaa9e16266e3d8d4a7f602df6')
sha1sums=('2040160fe7bb57b76dfddd80048fd47e9acb793f'
          '6633e6dbfab7e00cc659b6210379afb9166384f1')
sha256sums=('2f94eefc89823ac1f868af50a6ae94a1f26f2f615ba9aec40b26c1bb24f6376d'
            '8f927a37cf749fa6f279cc4c74dd82d5d7932901e8e86265309121785fd6cb14')
