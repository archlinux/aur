# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-doc-utils
pkgver=0.20.10+16+gc03cc09
pkgrel=3
pkgdesc="Documentation utilities for Gnome"
arch=('any')
license=('GPL' 'LGPL')
depends=(docbook-xml rarian python2-libxml2)
makedepends=(intltool gnome-common git)
url="https://www.gnome.org"
_commit=c03cc0963996934e03587af3e351c2bb9dab6b2a  # master
source=("git+https://git.gnome.org/browse/gnome-doc-utils#commit=$_commit")
source=("git+https://gitlab.gnome.org/Archive/gnome-doc-utils.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  rm -f m4/glib-gettext.m4
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$pkgname"
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr \
      --sysconfdir=/etc --mandir=/usr/share/man \
      --localstatedir=/var --disable-scrollkeeper
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
