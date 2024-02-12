# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_git=false
_local=false
_py="python"
_py2="${_py}2"
_proj="hip"
pkgname=ssh-utils
pkgver=0.1.1
pkgrel=1
_pkgdesc=(
  "A collection of SSH"
  "related scripts."
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  any
)
_gl="gitlab.com"
_gh="github.com"
_host="https://${_gh}"
_ns='themartiancompany'
_local="${HOME}/${pkgname}"
url="${_host}/${_ns}/${pkgname}"
license=(
  AGPL3
)
depends=(
  bash
)
makedepends=()
[[ "${_git}" == true ]] && \
  makedepends+=(
    git
  )
checkdepends=(
  shellcheck
)
optdepends=(
)
groups=(
 "${_proj}"
)
_branch="master"
_commit="e7e693c58e4e4cab4f65b8fe47a87e46c8d8a0bc"
source=()
sha256sums=()
[[ "${_git}" == true ]] && \
  if [[ "${_local}" == true ]]; then
    source+=(
      "${pkgname}-${pkgver}::git+${_local}#commit=${_commit}"
    )
  elif [[ "${_local}" == false ]]; then
    source+=(
      "${pkgname}-${pkgver}::git+${url}#commit=${_commit}"
    )
  fi && \
    sha256sums+=(
      SKIP
    )
[[ "${_git}" == false ]] && \
    source+=(
      "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    ) && \
    sha256sums+=(
      "3de8a8372de2864621db642ffe1eb8130ef5e34aed46bc10254b8b2c0e56e134"
    )

check() {
  ls "${srcdir}"
  cd \
    "${pkgname}-${pkgver}"
  make \
    -k \
    check
}

package() {
  cd \
    "${pkgname}-${pkgver}"
  make \
    DESTDIR="${pkgdir}" \
    install
}

# vim: ft=sh syn=sh et
