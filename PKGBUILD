
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=gmid
pkgver=1.7.1
pkgrel=1
pkgdesc='Fast Gemini server written with security in mind.'
arch=('x86_64')
url='https://git.omarpolo.com/gmid'
license=('ISC')
depends=('libressl')
source=("$url/snapshot/$pkgname-$pkgver.tar.gz")
sha256sums=('cf06e1f838e4e35eb4679c9ef5747cbc96326124e27ad874ad78743ce791c2d9')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure PREFIX='usr/'
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
