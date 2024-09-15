# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>

_srcname=polyglot
_pkgname=polyglot-winboard
pkgname=polyglot-winboard-git
pkgver=r44.5904a29
pkgrel=4
epoch=1
pkgdesc="UCI/USI/UCCI to XBoard adapter (WinBoard fork)"
arch=('i686' 'x86_64')
url="http://winboard.nl/cgi-bin?p=polyglot.git;a=summary"
license=('GPL-2.0-only')
makedepends=('git')
depends=('glibc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+http://winboard.nl/git/${_srcname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_srcname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_srcname}"

  ./configure --prefix=/usr
  make CFLAGS="$CFLAGS -fcommon" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS"
}

package() {
  cd "${srcdir}/${_srcname}"

  make DESTDIR="${pkgdir}" install
}
