
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=telescope
pkgver=0.3.1
pkgrel=2
pkgdesc='w3m-like browser for Gemini.'
arch=('x86_64')
url='https://telescope.omarpolo.com'
license=('ISC')
provides=('telescope')
conflicts=('telescope-git' 'telescope-bin')
depends=('libretls')
source=("https://github.com/omar-polo/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7c6fcde8b942095ba4b283828c59b0fc5d852bf1a2c0e7618b015e6200d4b987')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix='/usr'
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	rm -f "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
