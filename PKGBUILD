
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=gmid
pkgver=1.6.2
pkgrel=1
pkgdesc='Fast Gemini server written with security in mind.'
arch=('x86_64')
url='https://git.omarpolo.com/gmid'
license=('ISC')
depends=('libressl')
source=("$url/snapshot/$pkgname-$pkgver.tar.gz")
sha256sums=('1eaf2f6da2dd77cb3cda306036a5524abfd27bcdfa9d9b0cc364bf989aef8277')

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
