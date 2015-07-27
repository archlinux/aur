# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Auguste Pop <auguste [at] gmail [dot] com>

set -u
_pkgname='libgxps'
pkgname='libgxps-git'
pkgver=0.2.2.r34.gda79d91
pkgrel=1
pkgdesc='An XPS Documents library'
arch=('i686' 'x86_64')
url='http://git.gnome.org/browse/libgxps/'
license=('GPL')
depends=('cairo' 'libarchive' 'libtiff')
makedepends=('git' 'gnome-common' 'gtk-doc' 'gobject-introspection')
provides=('libgxps')
conflicts=('libgxps')

source=('git://git.gnome.org/libgxps')
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed -E -e 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
  set +u
}

prepare() {
  set -u
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  ./configure --prefix='/usr' --disable-test
  set +u
}

build() {
  set -u
  cd "${srcdir}/${_pkgname}"
  make -s -j $(nproc)
  set +u
}

package() {
  set -u
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install # This generates some /usr/lib errors
  set +u
}
set +u
