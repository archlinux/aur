# $Id$
# Maintainer: Adrià Arrufat <adria.arrufat+AUR@protonmail.ch>
# Original Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Timm Preetz <timm@preetz.us>

pkgname=vala-git
pkgver=0.37.1
pkgrel=1
pkgdesc="Compiler for the GObject type system"
url="https://wiki.gnome.org/Projects/Vala"
arch=(i686 x86_64)
license=(LGPL)
depends=(glib2)
provides=(vala valadoc)
conflicts=(vala valadoc)
makedepends=(libxslt git vala graphviz)
checkdepends=(dbus libx11 gobject-introspection)
source=("git+https://git.gnome.org/browse/vala")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname/-git}
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd ${pkgname/-git}
  # patch -Np1 -i ../../gparamspecpointer.diff
  # patch -Np1 -i ../../staticprivate.diff
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${pkgname/-git}
  ./configure --prefix=/usr --enable-vapigen
  make
}

# check() {
#   cd ${pkgname/-git}
#   make check
# }

package() {
  cd ${pkgname/-git}
  make DESTDIR="$pkgdir" install
}
