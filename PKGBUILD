##
# Maintainer: pyamsoft <developer(dot)pyamsoft(at)gmail(dot)com>
##

_gitname=iptables-geoblock
# shellcheck disable=SC2034
pkgname=iptables-geoblock-git
# shellcheck disable=SC2034
pkgdesc="Block IP addresses based on Country"
# shellcheck disable=SC2034
pkgver="0.0.1".r2.0149eec
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
arch=('any')
# shellcheck disable=SC2034
makedepends=('git')
# shellcheck disable=SC2034
depends=('iptables' 'xtables-addons' 'grep')
# shellcheck disable=SC2034
optdepends=()
# shellcheck disable=SC2034
provides=('iptables-geoblock')
# shellcheck disable=SC2034
conflicts=('iptables-geoblock')
# shellcheck disable=SC2034
license=('GPL2')
url="https://github.com/pyamsoft/iptables-geoblock.git"

##
# The SHA256 is constantly changing since this is
# pulled from git so skip the verification check
##
# shellcheck disable=SC2034
source=("${_gitname}::git+${url}#branch=main")
# shellcheck disable=SC2034
sha256sums=('SKIP') 

pkgver() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_gitname}" || {
    msg "Failed to cd into ${srcdir}/${_gitname}"
    return 1
  }

  printf "%s.r%s.%s" "$(awk -F '=' '{if (/^readonly VERSION=/) {print $2}}' "${_gitname}")" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
