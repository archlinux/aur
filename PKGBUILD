# $Id$
# Maintainer: Adria Arrufat <adria.arrufat+AUR@protonmail.ch>

pkgname=gxml-git
pkgver=0.12.0+9+g178aa9a
pkgrel=1
pkgdesc="GObject XML and Serialization API"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('glib2' 'libgee' 'libxml2')
provides=(${pkgname/-git})
conflicts=(${pkgname/-git})
makedepends=('gobject-introspection' 'vala')
url="https://wiki.gnome.org/GXml"
source=("git+https://git.gnome.org/browse/gxml")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname/-git}
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd ${pkgname/-git}
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${pkgname/-git}
  ./configure --prefix=/usr --enable-vapigen
  make
}

check() {
  cd ${pkgname/-git}
  make check
}

package() {
  cd ${pkgname/-git}
  make DESTDIR="$pkgdir" install
}
