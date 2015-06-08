# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=atomix
pkgname=$_pkgname-git
pkgver=3.16.0.r19.g4a84090
pkgrel=1
_realver=3.16.0
pkgdesc="Build molecules out of single atoms"
arch=('i686' 'x86_64')
license=('GPLv2')
depends=('gtk3' "glib2" "gdk-pixbuf2")
makedepends=('intltool' 'git' 'gnome-common' 'appstream-glib')
conflicts=('gnome-games' "${_pkgname}")
replaces=('gnome-games' "${_pkgname}")
provides=("${_pkgname}=$_realver")
options=('!emptydirs' '!libtool')
url="https://wiki.gnome.org/Apps/Atomix"
groups=('gnome-extra')
source=('git://git.gnome.org/atomix')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed -E 's/^ATOMIX_//;s/_/./g;s/([^-]*-g)/r\1/;s|-|.|g'
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
