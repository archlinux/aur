##
# Maintainer: pyamsoft <developer(dot)pyamsoft(at)gmail(dot)com>
##

_gitname=animwall
# shellcheck disable=SC2034
pkgname=animwall-git
# shellcheck disable=SC2034
pkgdesc="An orchestrator using xwinwrap and mpv to launch animated/gif desktop wallpapers"
# shellcheck disable=SC2034
pkgver=r1.2a35c5a
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
arch=('any')
# shellcheck disable=SC2034
makedepends=('git')
# shellcheck disable=SC2034
depends=('xwinwrap' 'mpv')
# shellcheck disable=SC2034
optdepends=()
# shellcheck disable=SC2034
provides=('animwall')
# shellcheck disable=SC2034
conflicts=('animwall')
# shellcheck disable=SC2034
license=('GPL2')
# shellcheck disable=SC2034
url="https://github.com/pyamsoft/animwall"

##
# The SHA256 is constantly changing since this is
# pulled from git so skip the verification check
##
# shellcheck disable=SC2034
sha256sums=('SKIP')
# shellcheck disable=SC2034
source=("${_gitname}::git+${url}#branch=main")

###############################################################################

pkgver() {
  # shellcheck disable=SC2154
  cd "$srcdir/$_gitname" || {
        msg "Error couldn't cd into $srcdir/$_gitname"
        return 1
  }

  # From
  # https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
  # If there are no tags then use number of revisions since beginning of the history:
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname" || {
        msg "Error couldn't cd into $srcdir/$_gitname"
        return 1
  }

  chmod 755 animwall
  mkdir -p "${pkgdir}/usr/bin"
  cp animwall "${pkgdir}/usr/bin/animwall"
}

