# $Id: PKGBUILD 249316 2015-10-14 04:36:15Z heftig $
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_pkgname=polari
pkgname=$_pkgname-git
pkgver=3.19.2.16.g3064de4
pkgrel=1
pkgdesc="An IRC Client for GNOME"
arch=(i686 x86_64)
license=(GPL)
url="https://wiki.gnome.org/Apps/Polari"
depends=(gjs gtk3 telepathy-glib telepathy-idle telepathy-mission-control telepathy-logger)
makedepends=(intltool gobject-introspection desktop-file-utils appdata-tools)
replaces=($_pkgname)
provides=($_pkgname-$pkgver)
conflicts=($_pkgname)
groups=(gnome-extra)
install=polari.install
source=('git+https://git.gnome.org/browse/polari')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $srcdir/$_pkgname
  ./autogen.sh --prefix=/usr --disable-Werror
  make
}

package() {
  cd $srcdir/$_pkgname
  make DESTDIR="$pkgdir" install
}
