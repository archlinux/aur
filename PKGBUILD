
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=gmid-git
_pkgname=${pkgname%-*}
pkgver=1.8.1.r2.gc6ae256
pkgrel=1
pkgdesc='Fast Gemini server written with security in mind.'
arch=('x86_64')
url='https://gmid.omarpolo.com'
license=('ISC')
provides=('gmid')
conflicts=('gmid' 'gmid-bin')
depends=('libretls')
source=("git+https://git.omarpolo.com/$_pkgname")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed 's/-/.r/;s/-/./'
}

build() {
	cd "$srcdir/$_pkgname"
	MANDIR='usr/share/man/' ./configure --prefix='usr/'
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
