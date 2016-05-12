# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pkgname='uncrustify'
pkgname="${_pkgname}-git"
pkgver=0.62.r71.g321fc5a
pkgrel=1
pkgdesc='A source code beautifier'
arch=('i686' 'x86_64')
url="http://${_pkgname}.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
makedepends=('git')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_srcdir="${pkgname^^}"
source=("${_srcdir}::git://github.com/bengardner/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  git describe | sed -e 's/^uncrustify-//' -e 's/-/.r/' -e 's/-/./'
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"
  ./autogen.sh
  ./configure --prefix='/usr'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
