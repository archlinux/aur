# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=gtksourceview3
pkgname=$_pkgname-git
_pkgbasename=gtksourceview
pkgver=3.17.3.11.g0685c16
_realver=3.17.3
pkgrel=1
pkgdesc="A text widget adding syntax highlighting and more to GNOME"
arch=('i686' 'x86_64')
license=('LGPL')
depends=("gtk3" 'libxml2' "glib2")
makedepends=('intltool' 'gobject-introspection' 'glade' 'gtk-doc' 'gnome-common')
options=('!libtool')
url="http://www.gnome.org"
conflicts=('gtksourceview3')
replaces=('gtksourceview3')
provides=("gtksourceview3=${_realver}")
source=('git://git.gnome.org/gtksourceview')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbasename"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgbasename"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --enable-glade-catalog --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/$_pkgbasename"
  make DESTDIR="$pkgdir" install
}
