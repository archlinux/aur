# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: beest <gnubeest@gmail.com>

pkgname=duc
pkgver=1.4.3
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

md5sums=('c67999bf8a5668e8a78a8b3abe8dba9f'
         'SKIP'
         'a43e8bafaa9e16266e3d8d4a7f602df6')
sha512sums=('5eb3e862e7003838e012dd1faab507a9b58607b77bd2af70a662005b6e4008ac44d1fb2e17b99da8e42ddfadb1cede2a468144ace7a72c12d0825fc7df4d18cd'
            'SKIP'
            '3b6bb894a9ee078976ea9c97d3cd840585f8622c87026aac681e7853a4603a3a0ea705376e328b9abfff2e5864433a13ce417fb53e290a00c1d619be5ec7a594')
