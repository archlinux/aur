# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Carter <alt.mcarter@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=neoleo
pkgver=15.1
pkgrel=1
pkgdesc="Lightweight curses spreadsheet based on GNU oleo"
arch=('x86_64')
url="https://github.com/blippy/neoleo"
license=('GPL-2.0-or-later')
depends=('ncurses')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b4c67a9887506a26c6f55e80bbf45316b424e6a123310d69c0c1e15842045dfb')

build() {
	cd "$pkgname-$pkgver"
	autoreconf -iv
	LIBS+=" -lstdc++fs" ./configure --prefix=/usr
	make CFLAGS+=" -Werror=use-after-free"
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
