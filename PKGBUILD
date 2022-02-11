
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=gmid
pkgver=1.8.1
pkgrel=1
pkgdesc='Fast Gemini server written with security in mind.'
arch=('x86_64')
url='https://gmid.omarpolo.com'
license=('ISC')
depends=('libretls')
conflicts=('gmid-git' 'gmid-bin')
source=("https://git.omarpolo.com/$pkgname/snapshot/$pkgname-$pkgver.tar.gz")
sha256sums=('b4c5bf614b910cb9e8f529e119e395e7bb5d6fffe305cf3994598d6e6a448b8e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	MANDIR='usr/share/man/' ./configure --prefix='usr/'
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
