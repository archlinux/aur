##
# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>
##

pkgname=git-ssh-git
_gitname=git-ssh
pkgdesc="A wrapper around git to work with multiple SSH keys"
pkgver=r45.67f4d64
pkgrel=1
arch=('any')
makedepends=('git')
depends=()
optdepends=()
provides=('git-ssh')
conflicts=('git-ssh')
license=('MIT')
url="https://github.com/pyamsoft/git-ssh.git"
install="${_gitname}.install"

##
# The SHA256 is constantly changing since this is
# pulled from git so skip the verification check
##
sha256sums=('SKIP')
source=("${_gitname}::git+${url}#branch=master")

###############################################################################

pkgver() {
  cd "$srcdir/$_gitname"
  # From
  # https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
  # If there are no tags then use number of revisions since beginning of the history:
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"

  install -Dm 755 "${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
}

