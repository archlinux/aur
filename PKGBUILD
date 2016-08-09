# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=libgepub
pkgname=$_pkgname-git
pkgver=395779e
pkgrel=1
_realver=0.3
pkgdesc="Simple library to read epub files using glib"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/libgepub"
license=('GPL2')
depends=("webkit2gtk" "libsoup" "glib2" "libxml2" "libarchive")
makedepends=("git" "gtk-doc" "gnome-common")
replaces=('libgepub')
provides=('libgepub' "libgepub=$_realver" "$_pkgname=$_realver")
conflicts=('libgepub')
source=('git://git.gnome.org/libgepub')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}
