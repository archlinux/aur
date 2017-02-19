# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=recipes
pkgver=0.12.0
pkgrel=1
pkgdesc="Recipe management application for GNOME"
arch=(x86_64 i686)
url="https://wiki.gnome.org/Apps/Recipes"
license=(GPL3)
depends=(gnome-autoar gspell)
source=(https://download.gnome.org/sources/recipes/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=(2807c6887ede60bca11fb82dab273ad4393fd2131df5c1564ef95508b891735e)

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
