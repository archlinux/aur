# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="grub"
_pkgname="arch-${_pkg}"
pkgname="${_pkgname}-git"
pkgver=v0.1+1+g3f11904
pkgrel=1
_pkgdesc=(
  'Produces a standalone GRUB binary'
  'compatible with Arch Linux.'
)
pkgdesc="${_pkgdesc[*]}"
arch=('any')
license=('AGPL3')
url="https://gitlab.archlinux.org/tallero/${_pkgname}"
depends=(
  "${_pkg}")
makedepends=(
  'git'
  'make'
)
checkdepends=(
  'shellcheck'
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || \
    exit
  git describe --tags | \
    sed 's/-/+/g'
}

check() {
  make -k check \
       -C "${_pkgname}"
}

# shellcheck disable=SC2154
package() {
  make DESTDIR="${pkgdir}" \
       PREFIX=/usr \
       install -C "${_pkgname}"
}
