
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=gmid
pkgver=1.8
pkgrel=1
pkgdesc='Fast Gemini server written with security in mind.'
arch=('x86_64')
url='https://gmid.omarpolo.com'
license=('ISC')
depends=('libretls')
conflicts=('gmid-git' 'gmid-bin')
source=("https://git.omarpolo.com/$pkgname/snapshot/$pkgname-$pkgver.tar.gz")
sha256sums=('70b627b4ed9586e9441c6a74b53bdc6bfed9e7e9f7c9fb338028b048ad292712')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	MANDIR='usr/share/man/' ./configure --prefix='usr/'
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make regress
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
