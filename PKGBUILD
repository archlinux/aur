# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_srcname=polyglot
_pkgname=polyglot-winboard
pkgname=polyglot-winboard-git
pkgver=r44.5904a29
pkgrel=3
epoch=1
pkgdesc="UCI/USI/UCCI to XBoard adapter (WinBoard fork)"
arch=('i686' 'x86_64')
url="http://hgm.nubati.net/cgi-bin/gitweb.cgi?p=polyglot.git;a=summary"
license=('GPL2')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+http://hgm.nubati.net/git/${_srcname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_srcname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_srcname}"

  ./configure --prefix=/usr
  make CFLAGS="$CFLAGS -fcommon"
}

package() {
  cd "${srcdir}/${_srcname}"

  make DESTDIR="${pkgdir}" install
}
