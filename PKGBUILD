# Contributor: Andrea Feletto <andrea@andreafeletto.com>

pkgname=telescope
pkgver=0.11
pkgrel=2
pkgdesc='w3m-like browser for Gemini'
arch=('x86_64')
url='https://www.telescope-browser.org/'
license=('ISC')
depends=('libbsd' 'libgrapheme' 'libretls' 'ncurses') #'imsg-compat'
source=("https://github.com/$pkgname-browser/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0b56fc56958d4b4c2ecc7dc971d4f7c156ca827d5bd97b70dcb541cf9e423927')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix='/usr' --with-libbsd #--with-libimsg
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 ChangeLog -t "$pkgdir/usr/share/doc/$pkgname"

	# Install contrib
	cp -dpr --no-preserve=ownership contrib/ "$pkgdir/usr/share/doc/$pkgname/"
}
