# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Miles Sandlar <miles at userbound.com>

set -u
_pkgname='wendy'
pkgname="${_pkgname}-git"
pkgver=0.7.r0.g914fb4a
pkgrel=1
pkgdesc='Watch a directory and execute a command on file creation/deletion/modification'
arch=('i686' 'x86_64')
url='http://git.z3bra.org/cgit.cgi/wendy'
license=('WTFPL')
depends=('glibc')
makedepends=('git')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
source=('git://phobos.z3bra.org/wendy')
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_pkgname}"
  git describe --long | sed -e 's:^v::g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}

build() {
  set -u
  cd "${_pkgname}"
  make
  set +u
}

package() {
  set -u
  cd "${_pkgname}"
  make PREFIX='/usr' DESTDIR="${pkgdir}" MANPREFIX='/usr/share/man' install
  set +u
}
set +u
