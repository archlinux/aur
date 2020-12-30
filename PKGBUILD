
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=cstatus-git
_pkgname=${pkgname%-*}
pkgver=1.0.0.r0.gcab32ee
pkgrel=1
pkgdesc='Minimal statusbar for dwm written in c99.'
arch=('x86_64')
url='https://git.sr.ht/~andreafeletto/cstatus'
license=('MIT')
depends=('libx11' 'alsa-lib')
provides=('cstatus')
conflicts=('cstatus')
source=("git+https://git.sr.ht/~andreafeletto/$_pkgname")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
