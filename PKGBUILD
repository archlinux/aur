# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_git=false
_local=false
_py="python"
_py2="${_py}2"
_proj="hip"
pkgname=luks-tools
pkgver=0.0.0.0.0.1.1
pkgrel=1
_pkgdesc=(
  "A collection of LUKS"
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
  cryptsetup
)
makedepends=(
  # git
)
[[ "${_git}" == true ]] && \
  makedepends+=(
    git
  )
checkdepends=(
  shellcheck
)
optdepends=(
  "python-pygmentize: colorized output"
  "python2-pygmentize: colorized output"
)
groups=(
 "${_proj}"
)
_branch="master"
_commit="84fb4c00f9569e4e182dca872563c35c7257d8c6"
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
      ciao
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
