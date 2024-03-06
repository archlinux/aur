# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

# shellcheck disable=SC2034
_distro="life"
pkgbase="${_distro}-keyring"
pkgname=(
  "${pkgbase}"
)
_tag="20220731" # git rev-parse ${pkgver}
pkgver="${_tag}" # "$(date +%Y.%m.%d)"
pkgrel=1
pkgdesc='Life PGP keyring'
arch=(
  'any'
)
_url="ssh://${_distro}_local_git/home/git/${pkgbase}"
url="https://gitlab.${_distro}.org/${_distro}/${pkgbase}"
license=(
  'GPL3'
)
groups=(
  'base-devel'
  'hip'
)
install="${pkgname}.install"
depends=(
  'pacman'
)
makedepends=(
  'git'
  'python'
  'sequoia-sq'
)
checkdepends=(
  'python-coverage'
  'python-pytest'
)
source=(
  "${pkgname}::git+${_url}#tag=${_tag}?signed"
)
sha256sums=(
  'SKIP'
)
validpgpkeys=(
  # Pellegrino Prevete
  '3D115DD206D92A0656C827BC8B686E3C22E4C2FA'
)

build() {
  cd \
    "${pkgname}" || \
    exit
  make \
    build
}

check() {
  cd \
    "${pkgname}" || \
    exit
  make \
    check
}

package() {
  cd \
    "${pkgname}" || \
    exit
  # shellcheck disable=SC2154
  make \
    PREFIX='/usr' \
    DESTDIR="${pkgdir}" \
    install
}

# vim:set sw=2 sts=-1 et:
