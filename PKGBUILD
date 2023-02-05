
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=buongiorno
pkgver=0.1.1
pkgrel=1
pkgdesc='Modal TUI greeter for greetd.'
arch=('x86_64')
url='https://sr.ht/~andreafeletto/buongiorno'
license=('GPL3')
depends=('greetd')
makedepends=('zig')
conflicts=('buongiorno-git')
source=("https://git.sr.ht/~andreafeletto/$pkgname/refs/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6678958a7bcc511723182f1d6d2a0260fd7307f70f572b2b881a04449e14f568')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	zig build -Drelease-safe -Dsystemd
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	DESTDIR="$pkgdir" zig build -Drelease-safe -Dsystemd --prefix '/usr'
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
