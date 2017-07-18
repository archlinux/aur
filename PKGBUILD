# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Timm Preetz <timm@preetz.us>

pkgname=vala0.26
_pkgname=vala
pkgver=0.26.2
pkgrel=1
pkgdesc="Compiler for the GObject type system. Legacy version for building Valama against."
url="https://wiki.gnome.org/Projects/Vala"
arch=(i686 x86_64)
license=(LGPL)
depends=(glib2)
provides=("vala=${pkgver}")
conflicts=('vala')
makedepends=(libxslt git)
source=("git://git.gnome.org/vala#tag=$pkgver")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr --enable-vapigen
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
