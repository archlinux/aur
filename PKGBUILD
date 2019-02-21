##
# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>
##

_gitname=xwinwrap
# shellcheck disable=SC2034
pkgname=xwinwrap-git
# shellcheck disable=SC2034
pkgdesc="Fork of XwinWrap from ujjwal96 on GitHub"
# shellcheck disable=SC2034
pkgver=r5.ec32e9b
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
arch=('any')
# shellcheck disable=SC2034
makedepends=('git')
# shellcheck disable=SC2034
depends=('git')
# shellcheck disable=SC2034
optdepends=()
# shellcheck disable=SC2034
provides=('xwinwrap')
# shellcheck disable=SC2034
conflicts=('xwinwrap')
# shellcheck disable=SC2034
license=('Other/Open Source')
# shellcheck disable=SC2034
url="https://github.com/ujjwal96/xwinwrap"

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
        msg "Error couldn't cd into $srcdir/$_gitname"
        return 1
  }

  # From
  # https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
  # If there are no tags then use number of revisions since beginning of the history:
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # shellcheck disable=SC2154
  cd "$srcdir/$_gitname" || {
        msg "Error couldn't cd into $srcdir/$_gitname"
        return 1
  }

  make
}

package() {
  cd "$srcdir/$_gitname" || {
        msg "Error couldn't cd into $srcdir/$_gitname"
        return 1
  }

  chmod 755 xwinwrap
  mkdir -p "${pkgdir}/usr/bin"
  cp xwinwrap "${pkgdir}/usr/bin/xwinwrap"
}

