# Maintainer: Brent George <brentdgeorge1 at gmail dot com>

pkgname=zlong-alert-git
_pkgname=zlong_alert
pkgver=r72.c6ae05c
pkgrel=1
pkgdesc="A ZSH plugin to alert you when a long-running command has finished"
arch=('any')
url='https://github.com/kevinywlui/zlong_alert.zsh'
license=('MIT')
depends=('zsh' 'oh-my-zsh-git')
makedepends=('git')
install="${_pkgname}.install"
source=("${pkgname}::git+https://github.com/kevinywlui/zlong_alert.zsh")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${pkgname}"

  install -vDm 644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm 644 ${_pkgname}{,.plugin}.zsh \
    -t "${pkgdir}/usr/share/oh-my-zsh/custom/plugins/${_pkgname}/"
}

# vim:set ts=2 sw=2 et:
