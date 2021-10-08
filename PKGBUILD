# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Tobias Bohrmann (PlainTextField) <honeypot.carbage@aechelon.de>

pkgname=tepl
pkgver=4.4.0
pkgrel=1
pkgdesc="Library that eases the development of GtkSourceView-based text editors and IDEs"
arch=(x86_64)
url="https://wiki.gnome.org/Projects/Tepl"
license=(LGPL2.1)
depends=(amtk gtksourceview4 uchardet)
makedepends=(gobject-introspection gtk-doc vala)
provides=(libtepl-${pkgver%%.*}.so)
source=("https://download.gnome.org/sources/tepl/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('e6f6673a8a27e8f280725db8fbacec79b20676ae0558755239d15a9808faa256')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
