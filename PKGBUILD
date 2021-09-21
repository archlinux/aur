
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=gmid
pkgver=1.7.3
pkgrel=1
pkgdesc='Fast Gemini server written with security in mind.'
arch=('x86_64')
url='https://gmid.omarpolo.com'
license=('ISC')
depends=('libretls')
conflicts=('gmid-git' 'gmid-bin')
source=("https://git.omarpolo.com/$pkgname/snapshot/$pkgname-$pkgver.tar.gz")
sha256sums=('bc5ea8756e433f919e8e524f1055b4f8b6e1237c9558842450e3e6829a0e578b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	MANDIR='usr/share/man/' ./configure PREFIX='usr/'
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
