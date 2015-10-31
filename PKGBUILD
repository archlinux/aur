# Maintainer: Adrian Sinclair <adrian at adrusi dot com>

_pkgname=dmenu-ee
pkgname=dmenu-ee-git
pkgver=fca1ce9
pkgrel=1
pkgdesc="fork of dmenu patched with XFT, quiet, x & y, token, fuzzy matching, follow focus, tab nav, filter and full mouse support."
url="https://github.com/toolpunk/dmenu-ee"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxinerama' 'libxft')
makedepends=('git')
provides=(dmenu)
conflicts=(dmenu)
source=(git://github.com/toolpunk/$_pkgname)
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git log | head -n 1 | cut -c8-14
}

build() {
	cd "$srcdir/$_pkgname"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
