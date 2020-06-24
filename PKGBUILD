# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=polyglot
pkgname=polyglot-winboard-git
pkgver=r44.5904a29
pkgrel=2
epoch=1
pkgdesc="UCI/USI/UCCI to XBoard adapter (WinBoard fork)"
arch=('i686' 'x86_64')
url="http://hgm.nubati.net/cgi-bin/gitweb.cgi?p=polyglot.git;a=summary"
license=('GPL2')
depends=('glibc')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
source=("git+http://hgm.nubati.net/git/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./configure --prefix=/usr
  make CFLAGS="$CFLAGS -fcommon"
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
}
