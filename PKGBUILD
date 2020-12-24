##
# Maintainer: pyamsoft <developer(dot)pyamsoft(at)gmail(dot)com>
##

_gitname=herotate
# shellcheck disable=SC2034
pkgname=herotate-git
# shellcheck disable=SC2034
pkgdesc="A Heroku multi-login manager for heroku-cli"
# shellcheck disable=SC2034
pkgver=r4.a444721
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
arch=('any')
# shellcheck disable=SC2034
makedepends=('git')
# shellcheck disable=SC2034
depends=()
# shellcheck disable=SC2034
optdepends=(
  'heroku-cli: Heroku CLI'
)
# shellcheck disable=SC2034
provides=('herotate')
# shellcheck disable=SC2034
conflicts=('herotate')
# shellcheck disable=SC2034
license=('Apachev2.0')
url="https://github.com/pyamsoft/herotate.git"

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
    msg "Could not cd into $srcdir/$_gitname"
    return 1
  }
  # From
  # https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
  # If there are no tags then use number of revisions since beginning of the history:
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname" || {
    msg "Could not cd into $srcdir/$_gitname"
    return 1
  }

  chmod 755 "${_gitname}"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/doc/${_gitname}"
  mkdir -p "${pkgdir}/usr/share/licenses/${_gitname}"

  cp "${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
  cp "LICENSE" "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
  cp "README.md" "${pkgdir}/usr/share/doc/${_gitname}/README.md"
}
