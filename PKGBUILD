# Maintainer: Sergio Correia <sergio@correia.cc>
# Contributor: Nicolas Vivet <nizzox@gmail.com>

pkgname=arcanist-git
_pkgname=arcanist
pkgver=conduit.5.693.ge4b1e8e
pkgrel=1
pkgdesc='Arcanist (commonly, "arc") is the command-line frontend to Phabricator'
arch=('any')
url="http://phabricator.com"
license=('Apache')
depends=('libphutil-git')
makedepends=('git')
provides=('arcanist')
install='arcanist.install'
source=('git://github.com/facebook/arcanist.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --always | sed 's|-|.|g' # Use the tag of the last commit
}

package() {
  install -Dd "${srcdir}"/usr/share/php/"${_pkgname}" "${pkgdir}"/etc/bash_completion.d "${pkgdir}"/usr/bin

  # do not copy hidden directories
  mkdir -p  "${pkgdir}"/usr/share/php/"${_pkgname}"
  cp -a "${srcdir}"/"${_pkgname}"/* "${pkgdir}"/usr/share/php/"${_pkgname}"/
  ln -s ../../usr/share/php/"${_pkgname}"/resources/shell/bash-completion "${pkgdir}"/etc/bash_completion.d/"${_pkgname}"
  ln -s ../share/php/"${_pkgname}"/bin/arc "${pkgdir}"/usr/bin/arc
}

# vim:set ts=2 sw=2 et:
