# Contributor: Andrea Feletto <andrea@andreafeletto.com>

pkgname=telescope
pkgver=0.10.1
pkgrel=1
pkgdesc='w3m-like browser for Gemini'
arch=('x86_64')
url='https://www.telescope-browser.org/'
license=('ISC')
depends=('libbsd' 'libgrapheme' 'libretls' 'ncurses') #'imsg-compat'
source=("https://github.com/$pkgname-browser/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('01446a1129741c6a201c4b5446390e9331487af844cef6bfd35419989168e618')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix='/usr' --with-libbsd #--with-libimsg
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
