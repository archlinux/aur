# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg=archiso
_variant="persistent"
_pkgname="${_pkg}-profiles"
pkgname="${_pkgname}-git"
pkgver=v0.1+38+g10d5d33
pkgrel=1
pkgdesc='Extra profiles for Archiso'
arch=('any')
license=('GPL3')
url="https://gitlab.archlinux.org/tallero/${_pkgname}"
depends=("${_pkg}-${_variant}-git")
makedepends=('git')
checkdepends=('shellcheck')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

# shellcheck disable=SC2154
package() {
  local _profiles="${srcdir}/${_pkgname}"
  local _dest="${pkgdir}/usr/share/${_pkg}/configs"
  local _bin_dest="${pkgdir}/usr/lib/${_pkg}"
  local pkg
  install -dm755 "${_dest}"
  install -dm755 "${_bin_dest}"
  for pkg in "${_profiles}"/*; do
    cp -r "${pkg}" "${_dest}"
  done
  mv "${_profiles}/jupyter" "${_bin_dest}"
  cp -r "${_profiles}/.gitlab/ci"/* "${_bin_dest}"
}
