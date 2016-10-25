# $Id$
# Maintainer: Adria Arrufat <adria.arrufat+AUR@protonmail.ch>

pkgname=gxml-git
pkgver=0.12.0
pkgrel=1
pkgdesc="GObject XML and Serialization API"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('glib2' 'libgee' 'libxml2')
provides=(${pkgname/-git})
conflicts=(${pkgname/-git})
makedepends=('gobject-introspection' 'vala')
url="https://wiki.gnome.org/GXml"
_commit="a0b55b0fbae50359a361bff4c7ec49f975b2fa90"
source=("git+https://git.gnome.org/browse/gxml#commit=${_commit}")
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
  ./configure --prefix=/usr --enable-vapigen --enable-docs
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
