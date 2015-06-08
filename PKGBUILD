# $Id$
# Maintainer: Realex
# Based on cinnamon-desktop PKGBUILD

_pkgname=cinnamon-desktop
pkgname=${_pkgname}-git
pkgver=103.f4ee205
pkgrel=1
pkgdesc="Library with common API for various Cinnamon modules"
arch=(i686 x86_64)
license=(GPL LGPL)
depends=('gtk3' 'libxkbfile')
makedepends=('intltool' 'gobject-introspection' 'gnome-common' 'git')
url="https://github.com/linuxmint/cinnamon-desktop"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!emptydirs')
source=("git+https://github.com/linuxmint/${_pkgname}.git")
sha512sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd ${srcdir}/${_pkgname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd ${srcdir}/${_pkgname}
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/${_pkgname} --disable-static
  make
}

package() {
  cd ${srcdir}/${_pkgname}
  make DESTDIR="$pkgdir" install
}
