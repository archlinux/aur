##
# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>
##

_gitname=git-ssh
# shellcheck disable=SC2034
pkgname=git-ssh-git
# shellcheck disable=SC2034
pkgdesc="A wrapper around git to work with multiple SSH keys"
# shellcheck disable=SC2034
pkgver=r155.4580857
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
provides=('git-ssh')
# shellcheck disable=SC2034
conflicts=('git-ssh')
# shellcheck disable=SC2034
license=('MIT')
# shellcheck disable=SC2034
install="${_gitname}.install"
url="https://github.com/pyamsoft/git-ssh.git"

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

package() {
  # shellcheck disable=SC2154
  cd "$srcdir/$_gitname" || {
        msg "Error couldn't cd into $srcdir/$_gitname"
        return 1
  }

  # shellcheck disable=SC2154
  install -Dm 755 "${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
}

