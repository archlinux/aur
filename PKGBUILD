# Maintainer: Pellegrino Prevete (dvorak) <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>

_pkgbase=termux-setup-pacman
pkgbase="${_pkgbase}-git"
pkgname=(
  "${pkgbase}"
)
pkgdesc="Script to setup a pacman environment on Termux."
_http="https://github.com"
_ns="themartiancompany"
url="${_http}/${_ns}/${_pkgbase}"
pkgver=0.1
pkgrel=2
license=(
  'AGPL3')
depends=(
  curl)
makedepends=(
  'git'
)
checkdepends=(
  'shellcheck'
)
optdepends=(
)
arch=(
  any
)
source=(
  "${pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${pkgname}"
  git \
    describe \
    --tags | \
    sed \
      's/-/+/g'
}

check() {
  cd \
    "${pkgname}"
  make \
    -k \
    check
}

package() {
  local \
    _opts=()
  _opts=(
    DESTDIR="${pkgdir}"
    PREFIX='/usr'
  )
  cd \
    "${pkgname}"
  make \
    "${_opts[@]}" \
      install
}

# vim:set sw=2 sts=-1 et:
