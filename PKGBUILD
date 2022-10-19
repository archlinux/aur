##
# Maintainer: pyamsoft <developer(dot)pyamsoft(at)gmail(dot)com>
##

_gitname=amd-disable-c6
# shellcheck disable=SC2034
pkgname=amd-disable-c6-git
# shellcheck disable=SC2034
pkgdesc="Automatically disable the C6 power saving state on AMD Zen (Ryzen / Epyc) processors"
# shellcheck disable=SC2034
pkgver=r13.4eb03b5
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
arch=('i686' 'x86_64')
# shellcheck disable=SC2034
makedepends=('git')
# shellcheck disable=SC2034
depends=()
# shellcheck disable=SC2034
optdepends=()
# shellcheck disable=SC2034
provides=('amd-disable-c6' 'disable-c6-systemd')
# shellcheck disable=SC2034
conflicts=('amd-disable-c6' 'disable-c6-systemd')
# shellcheck disable=SC2034
license=('MIT')
url="https://github.com/joakimkistowski/amd-disable-c6.git"

##
# The SHA256 is constantly changing since this is
# pulled from git so skip the verification check
##
# shellcheck disable=SC2034
source=("${_gitname}::git+${url}#branch=master")
# shellcheck disable=SC2034
sha256sums=('SKIP')

pkgver() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_gitname}" || {
        msg "Failed to cd into ${srcdir}/${_gitname}"
        return 1
  }

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_gitname}" || {
        msg "Failed to cd into ${srcdir}/${_gitname}"
        return 1
  }
}

package() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_gitname}" || {
        msg "Failed to cd into ${srcdir}/${_gitname}"
        return 1
  }

  # shellcheck disable=SC2154
  make DESTDIR="${pkgdir}" install
}
