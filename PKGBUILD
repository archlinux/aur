# Maintainer: aksr <aksr at t-com dot me>
pkgname=tine-git
pkgver=r66.3049071
pkgrel=1
pkgdesc="A modern clone of the AmigaDOS/TRIPOS ED display editor"
arch=('i686' 'x86_64')
url="https://github.com/deadpixi/tine"
license=('GPL3')
depends=(ncurses)
makedepends=('git')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's@<ncursesw/ncurses.h>@<ncurses.h>@g' Makefile
	sed -i 's@-lncursesw@-lncurses@g' Makefile
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/usr" install
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
