# Maintainer: Leandro Vital <leavitals at gmail dot com>

_pkgname=dmenux
pkgname=dmenux-git
pkgver=e9f1041
pkgrel=1
pkgdesc="fork of dmenu patched with XFT, quiet, x & y, token, fuzzy matching, follow focus, tab nav, filter and full mouse support."
url="https://github.com/lvitals/dmenux"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxinerama' 'libxft')
makedepends=('git')
provides=(dmenu)
conflicts=(dmenu)
source=(git://github.com/lvitals/$_pkgname)
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git log | head -n 1 | cut -c8-14
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
