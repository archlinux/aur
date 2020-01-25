# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=libpeas
pkgname=$_pkgname-git
pkgver=1.25.3.r9.g1714442
pkgrel=1
_realver=1.14.1
pkgdesc="A GObject-based plugins engine"
arch=(i686 x86_64)
url="https://wiki.gnome.org/Projects/Libpeas"
license=(GPL2)
depends=(gtk3 gobject-introspection-runtime)
makedepends=(gtk-doc python-gobject glade gobject-introspection git meson vala)
optdepends=('python-gobject: Python loader')
options=('!libtool')
install=$_pkgname.install
provides=("${_pkgname}=${_realver}")
conflicts=("${_pkgname}")
replace=("${_pkgname}")
source=('git+https://gitlab.gnome.org/GNOME/libpeas.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed -E 's/^libpeas.//;s/_/./g;s/([^-]*-g)/r\1/;s|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"
  
  mkdir -p build
  cd build

  meson -D vapi=true -D gtk_doc=true
  ninja
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR="$pkgdir" meson install -C build
}
