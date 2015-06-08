# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=baobab
pkgname=$_pkgname-git
pkgver=3.16.1.2.ga28ca81
_realver=3.16.1
pkgrel=1
pkgdesc="A graphical directory tree analyzer"
arch=(i686 x86_64)
url="http://gnome.org"
license=('GPL2')
depends=("glib2" 'dconf' "gtk3>=3.13.2" 'gsettings-desktop-schemas' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('intltool' 'itstool' "vala>=0.25.1" 'gobject-introspection')
groups=('gnome-extra')
provides=("${_pkgname}=${_realver}")
conflicts=("${_pkgname}")
replace=("${_pkgname}")
install=$_pkgname.install
source=('git://git.gnome.org/baobab')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe | sed 's/^v//;s/-/./g;s/_/./g;'
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
