# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_local=false
_git=false
_proj="hip"
pkgname=dynssh
pkgver=1.1.4.1.1
pkgrel=1
pkgdesc="Small SSH wrapper"
arch=(
  any
)
_host='https://github.com'
_ns='themartiancompany'
url="${_host}/${_ns}/${pkgname}"
license=(
  AGPL3)
depends=(
  openssh
  net-tools
)
makedepends=( 
)
groups=(
  "${_proj}"
)
checkdepends=(
  shellcheck
)
source=()
sha256sums=()
_url="${url}"
[[ "${_local}" == true ]] && \
  _url="file://${HOME}/${pkgname}"
[[ "${_git}" == true ]] && \
  makedepends+=(
    git 
  ) && \
  source+=(
    "${_pkgname}-${pkgver}::git+${_url}#tag=${pkgver}"
  ) && \
  sha256sums+=(
    "SKIP"
  )
[[ "${_git}" == false ]] && \
  source+=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  ) && \
  sha256sums+=(
    4a13daeec0b6370969a87a37512441d1cd6185c5e563a4557a47cf62b1abe7e5
  )

check() {
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
