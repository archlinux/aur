##
# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>
##

_gitname=ipwaiter
# shellcheck disable=SC2034
pkgname=ipwaiter-git
# shellcheck disable=SC2034
pkgdesc="ipwaiter serves iptables"
# shellcheck disable=SC2034
pkgver=r9.0f0d49d
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
arch=('any')
# shellcheck disable=SC2034
makedepends=('git')
# shellcheck disable=SC2034
depends=('iptables')
# shellcheck disable=SC2034
optdepends=()
# shellcheck disable=SC2034
provides=('ipwaiter')
# shellcheck disable=SC2034
conflicts=('ipwaiter')
# shellcheck disable=SC2034
license=('GPLv2')
url="https://github.com/pyamsoft/ipwaiter.git"

##
# The SHA256 is constantly changing since this is
# pulled from git so skip the verification check
##
# shellcheck disable=SC2034
sha256sums=('SKIP')
# shellcheck disable=SC2034
source=("${_gitname}::git+${url}#branch=master")

###############################################################################

pkgver() {
  # shellcheck disable=SC2154
  cd "$srcdir/$_gitname" || {
        msg "Could not cd into $srcdir/$_gitname"
        return 1
  }
  # From
  # https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
  # If there are no tags then use number of revisions since beginning of the history:
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # shellcheck disable=SC2154
  cd "$srcdir/$_gitname" || {
        msg "Could not cd into $srcdir/$_gitname"
        return 1
  }

  # shellcheck disable=SC2154
  DESTDIR="${pkgdir}" ./install.sh
}

