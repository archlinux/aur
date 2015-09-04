# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: megadriver <megadriver at gmx dot com>

set -u
_pkgname='uncsv'
pkgname="${_pkgname}-git"
pkgver=0.9.1.r32.gdce99a6
pkgrel=1
pkgdesc='Convert to or from a CSV stream'
arch=('i686' 'x86_64')
url="https://tamentis.com/projects/${_pkgname}/"
license=('ISC')
depends=('glibc')
makedepends=('git')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_srcdir="${pkgname^^}"
source=("${_srcdir}::git://github.com/tamentis/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  local _vcsver="$(git describe --long | sed -e 's:^v::g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g')"
  local _vcsrev="$(git rev-list --count HEAD)"
  echo "${_vcsver//.r0./.r${_vcsrev}.}"
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"
  ./configure
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -s
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make PREFIX="${pkgdir}/usr" install
  install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
  set +u
}
set +u
