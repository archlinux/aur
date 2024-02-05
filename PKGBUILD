# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Marcell Meszaros (MarsSeed) <marcell.meszaros@runbox.eu>

_py="python"
_py2="${_py}2"
_git="false"
pkgname=reallymakepkg
_pkgver="1.1.1.1.1"
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="System-independent makepkg"
arch=(
  any
)
_repo="https://github.com"
_ns="themartiancompany"
url="${_repo}/${_ns}/${pkgname}"
license=(
  AGPL3
)
depends=(
  bash
)
makedepends=()
checkdepends=(
  # shellcheck
)
optdepends=(
  "${_py}-pygments: colorized output and syntax highlighting"
  # "${_py2}-pygments: colorized output and syntax highlighting"
)
source=()
sha256sums=()
_url="file://${HOME}/${_pkgname}"
[[ "${_git}" == true ]] && \
  makedepends+=(
    git
  ) && \
  source+=(
    "${pkgname}-${pkgver}::git+${url}"
  ) && \
  sha256sums+=(
    SKIP
  )
[[ "${_git}" == false ]] && \
  source+=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  ) && \
  sha256sums+=(
    '01d0d0491960264be91f0846a313f4ace21a9b15d0ba55e4cc12de947991933b'
  )

package() {
  cd \
    "${pkgname}-${_pkgver}"
  make \
    DESTDIR="${pkgdir}" \
    install
}

# vim: ft=sh syn=sh et
