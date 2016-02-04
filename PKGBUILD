# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Gerasev Kirill <gerasev.kirill@gmail.com>

_pkgname=light-desktop-item-edit
pkgname="${_pkgname}-git"
pkgver=0.3.r35.f38a55e
pkgrel=2
epoch=2
pkgdesc="Light editor for *.desktop files without gnome-panel or xfce dependencies."
arch=(any)
url="https://github.com/gerasev-kirill/light-desktop-item-edit"
license=('LGPL')
depends=('python2-gobject' 'gtk3')
makedepends=('git' 'intltool')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/gerasev-kirill/light-desktop-item-edit.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"

  local ver=$(grep '^AC_INIT' configure.ac | sed 's/.*\[\(.*\)\])/\1/')
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_pkgname}"

  make DESTDIR="${pkgdir}" install
}

