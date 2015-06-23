# Maintainer: mickael9 <mickael9 at gmail dot com>
# Contributor: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=r2-bindings-git
_pkgname=radare2-bindings
pkgver=r502.56750b7
pkgrel=1
pkgdesc="Language bindings of the radare2 api for valabind and friends"
url="http://radare.org"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('radare2' 'python2' 'python')
conflicts=('r2-bindings')
provides=('r2-bindings')
makedepends=('valabind')
options=('!emptydirs')
source=(git+https://github.com/radare/${_pkgname}.git)
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
  cd ${_pkgname}
  ./configure --prefix=/usr --enable=ctypes --enable=python
  make
}
 
package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
}
 
# vim: ts=2 sw=2 et:
