# Maintainer: aksr <aksr at t-com dot me>
pkgname=conterm-git
pkgver=r124.ff04286
pkgrel=1
pkgdesc='Drawterm without graphical user interface. '
arch=('i686' 'x86_64')
url='https://github.com/0intro/conterm'
license=('MIT' 'LPL')
makedepends=('git')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	CONF=unix make
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 drawterm $pkgdir/usr/bin/conterm
	install -D -m644 drawterm.ico $pkgdir/usr/share/pixmaps/conterm.ico
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
