pkgname=tepl-git
_pkgname=tepl
pkgver=4.3.1+1+g03287cd
pkgrel=1
pkgdesc="Library that eases the development of GtkSourceView-based text editors and IDEs"
arch=(x86_64)
url="https://wiki.gnome.org/Projects/Tepl"
license=(LGPL2.1)
depends=('amtk' 'gtksourceview4' 'uchardet')
makedepends=('gobject-introspection' 'gtk-doc' 'vala')
provides=('tepl')
conflicts=('tepl')
source=("git+https://gitlab.gnome.org/GNOME/tepl")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd $_pkgname
  ./autogen.sh --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
