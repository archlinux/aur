# Maintainer: aksr <aksr at t-com dot me>
pkgname=sc-git
pkgver=7.16.r151.e9938b4
pkgrel=1
pkgdesc='A free curses-based spreadsheet program.'
arch=('i686' 'x86_64')
url='https://github.com/n-t-roff/sc'
license=('unknown')
makedepends=('git')
depends=('ncurses')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s.r%s.%s" "$(git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/_.*//')" \
	                   "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	./configure
	make
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p $pkgdir/usr/share/{man/man1,licenses/${pkgname%-*}}
	make prefix="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man/man1" install
}
