# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg=archiso
_variant="encryption"
_pkgname="${_pkg}-profiles"
pkgname="${_pkgname}-git"
pkgver=v0.2+22+g9877e40
pkgrel=1
pkgdesc='Extra profiles for Archiso'
arch=('any')
license=('AGPL3')
url="https://gitlab.archlinux.org/tallero/${_pkgname}"
depends=("${_pkg}-${_variant}-git")
makedepends=('git' 'make')
checkdepends=('shellcheck')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || exit
  git describe --tags | sed 's/-/+/g'
}

check() {
  make -k check -C "${_pkgname}"
}

# shellcheck disable=SC2154
package() {
  make DESTDIR="${pkgdir}" PREFIX=/usr install -C "${_pkgname}"
}
