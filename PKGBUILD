# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: beest <gnubeest@gmail.com>

pkgname=duc
pkgver=1.3.3
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

sha1sums=('757c958452fe7da4e5067474e17534dd6a26d027'
          '6633e6dbfab7e00cc659b6210379afb9166384f1')
sha256sums=('73f4260994dea91a975b8e8cf7ba9a3b144e4787bc125d37747a106d3043b726'
            '8f927a37cf749fa6f279cc4c74dd82d5d7932901e8e86265309121785fd6cb14')
md5sums=('20a3a2e470f49c8748757801d96b16d8'
         'a43e8bafaa9e16266e3d8d4a7f602df6')
