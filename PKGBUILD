# $Id$
# Maintainer: Realex
# Based on cinnamon-menus PKGBUILD

_pkgname=cinnamon-menus
pkgname=${_pkgname}-git
pkgver=5.2.0.r0.g1d7cb63f
pkgrel=1
pkgdesc="Cinnamon menu specifications"
arch=('i686' 'x86_64')
depends=(glib2)
makedepends=(gobject-introspection meson samurai)
conflicts=(${_pkgname})
provides=(${_pkgname})
license=('GPL' 'LGPL')
url="https://github.com/linuxmint/cinnamon-menus"
source=("${_pkgname}"::git+https://github.com/linuxmint/cinnamon-menus.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson cinnamon-menus build
  samu -C build
}

package(){
  DESTDIR="$pkgdir" ninja -C build install
}
