# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: beest <gnubeest@gmail.com>

pkgname=duc
pkgver=1.4.2
pkgrel=2
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

md5sums=('f55c0d132cd46e15bafa7a1086e8658c'
         'SKIP'
         'a43e8bafaa9e16266e3d8d4a7f602df6')
sha1sums=('2040160fe7bb57b76dfddd80048fd47e9acb793f'
          'SKIP'
          '6633e6dbfab7e00cc659b6210379afb9166384f1')
sha256sums=('2f94eefc89823ac1f868af50a6ae94a1f26f2f615ba9aec40b26c1bb24f6376d'
            'SKIP'
            '8f927a37cf749fa6f279cc4c74dd82d5d7932901e8e86265309121785fd6cb14')
sha512sums=('9abfc0049cd7a92a61e2b7374ba8f1eefe2c95233a470d84575ae63481cdf844337aea204e7fbc3ee3d65f4d96fe03645b6fadcba60401cbed1630d9aae69e2a'
            'SKIP'
            '3b6bb894a9ee078976ea9c97d3cd840585f8622c87026aac681e7853a4603a3a0ea705376e328b9abfff2e5864433a13ce417fb53e290a00c1d619be5ec7a594')
