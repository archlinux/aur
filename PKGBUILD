# Maintainer: Bart Libert <bart plus aur at libert dot email>
_pkgname=git-branch-status
pkgname=${_pkgname}-git
pkgver=r14.7608705
pkgrel=1
pkgdesc="Git command to give you an overview of your branches"
arch=('any')
url="https://github.com/alexdavid/${_pkgname}.git"
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')
license=('MIT')
depends=('bash' 'git')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  cd "${_pkgname}"
  install -Dm755 ${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
