# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: skottish <skottish97215 at gmail com>

set -u
_pkgname='mt-st'
pkgname="${_pkgname}-git"
pkgver=1.1.r6.gece9c03
pkgrel=1
pkgdesc='Utilities for managing magnetic tape storage devices'
arch=('i686' 'x86_64')
url="https://github.com/Distrotech/${_pkgname}"
license=('GPLv2')
depends=('tar')
makedepends=('git')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::${url//https/git}.git")
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_pkgname}"
  printf '%s.r%s.g%s' "$(sed -ne 's:^#define VERSION "\(.*\)"$:\1:p' "mt.c")" "$(git rev-list --count HEAD)" "$(git describe --always )" # '
  set +u
}

prepare() {
  set -u
  cd "${_pkgname}"
  sed -e 's:^#include <sys/types.h>$:#include <sys/sysmacros.h>\n&:g' -i 'mt.c'
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
  make DESTDIR="${pkgdir}" PREFIX='/usr' SBINDIR='/usr/bin' install
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
