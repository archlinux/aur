
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=telescope-git
_pkgname=${pkgname%-*}
pkgver=0.3.r126.ga1e5a81
pkgrel=1
pkgdesc='w3m-like browser for Gemini.'
arch=('x86_64')
url='https://git.omarpolo.com/telescope'
license=('ISC')
provides=('telescope')
conflicts=('telescope')
depends=('libretls')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed 's/-/.r/;s/-/./'
}

build() {
	cd "$srcdir/$_pkgname"
	./autogen.sh
	./configure --prefix='/usr'
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
