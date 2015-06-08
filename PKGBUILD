# $Id$
# Maintainer: Realex
# Based on cjs PKGBUILD

_pkgname=cjs
pkgname=${_pkgname}-git
pkgver=1276.7bb3d1b
pkgrel=1
pkgdesc="Javascript Bindings for Cinnamon"
arch=(i686 x86_64)
url="https://github.com/linuxmint/cjs"
license=(GPL)
depends=('cairo' 'gobject-introspection' 'js185' 'dbus-glib')
makedepends=('gnome-common')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!libtool')
source=(${_pkgname}::git+https://github.com/linuxmint/cjs.git)
sha256sums=(SKIP)

pkgver() {
  cd ${srcdir}/${_pkgname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd ${srcdir}/${_pkgname}
  ./autogen.sh --prefix=/usr --disable-static --libexecdir=/usr/lib
  make
}

check() {
  cd ${srcdir}/${_pkgname}
  # Needs a display
  make -k check || :
}

package() {
  cd ${srcdir}/${_pkgname}
  make DESTDIR="$pkgdir" install
}
