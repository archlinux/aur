# $Id$
# Maintainer: goetzc
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Tobias Bohrmann (PlainTextField) <honeypot.carbage@aechelon.de>

pkgname=tepl3
_pkgname=tepl
pkgver=3.0.0
pkgrel=1
pkgdesc="Library that eases the development of GtkSourceView-based text editors and IDEs"
arch=('x86_64' 'i686')
url="https://wiki.gnome.org/Projects/Tepl"
license=('LGPL2.1')
depends=('gtksourceview3' 'uchardet')
makedepends=('gobject-introspection' 'vala')
source=("https://download.gnome.org/sources/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.xz")
sha256sums=('9eb6fceb0b521de7bf684508138a5b8428d9f575c395ba54f9e31597980fd0ef')

build() {
	cd $_pkgname-$pkgver
	./configure --prefix=/usr
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

package() {
	cd $_pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
