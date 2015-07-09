# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=fltk-editor
_pkgname=fltk
pkgver=1.3.2
pkgrel=1
pkgdesc="Simple text editor application for FLTK"
arch=('i686' 'x86_64')
url="http://www.fltk.org/"
license=('LGPL')
depends=('fltk')
makedepends=('gendesk')
source=(http://fltk.org/pub/fltk/$pkgver/fltk-$pkgver-source.tar.gz)
md5sums=('9f7e707d4fb7a5a76f0f9b73ff70623d')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	sed -i -e 's/$(LINKFLTK)/$(LINKSHARED)/' \
		-e 's/$(LINKFLTKIMG)/$(LINKSHARED)/' test/Makefile
	gendesk -n -f --pkgname=$pkgname --pkgdesc="Simple text editor" --name="FLTK Editor" --categories="Utility;TextEditor"
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	./configure --prefix=/usr --enable-threads --enable-xft --enable-shared
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -Dm755 test/editor "$pkgdir/usr/bin/$pkgname"
	install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
