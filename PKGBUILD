# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

# shellcheck disable=SC2034
_distro="life"
_pkgname=${_distro}-keyring
pkgname="${_pkgname}-git"
pkgver="$(date +%Y.%m.%d)"
pkgrel=1
pkgdesc='Life PGP keyring'
arch=('any')
_url="ssh://${_distro}_local_git/home/git/${_pkgname}"
url="https://gitlab.${_distro}.org/${_distro}/${_pkgname}"
license=('GPL3')
groups=('base-devel')
install="${_pkgname}.install"
depends=('pacman')
makedepends=('git' 'python' 'sequoia-sq')
checkdepends=('python-coverage' 'python-pytest')
source=("${_pkgname}::${_url}?signed")
sha256sums=('SKIP')
validpgpkeys=('3ABCBB9E8C2DE5D8D3264CD2D92FC471693D9BB7')

build() {
  cd "${_pkgname}" || exit

  make build
}

check() {
  cd "${_pkgname}" || exit

  make check
}

package() {
  cd "${_pkgname}" || exit

  # shellcheck disable=SC2154
  make PREFIX='/usr' DESTDIR="${pkgdir}" install
}
