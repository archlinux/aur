# Mantainer Mattia De Rosa <mattiadr96 at gmail dot com>

pkgname=st-mattiadr
pkgver=0.8.3a
pkgrel=1
pkgdesc='Fork of the suckless terminal with additional patches.'
arch=('x86_64')
url='https://github.com/mattiadr/st'
license=('MIT')
depends=('libxft' 'libxext' 'xorg-fonts-misc')
provides=('st')
conflicts=('st')
source=("https://github.com/mattiadr/st/archive/$pkgver.tar.gz")
md5sums=('33463b3a49fb2f507323d33d999ddf3a')

prepare() {
	cd $srcdir/st-$pkgver
	# skip terminfo which conflicts with nsurses
	sed -i '/tic /d' Makefile
}

build() {
	cd $srcdir/st-$pkgver
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd $srcdir/st-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
}
