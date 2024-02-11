# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Marcell Meszaros (MarsSeed) <marcell.meszaros@runbox.eu>

_proj="hip"
_pkgbase=dynssh
pkgname="${_pkgbase}-git"
pkgver=v0.1.2.r13.g3af71ae
pkgrel=1
pkgdesc="Simple SSH wrapper"
arch=(
  any
)
_gl="gitlab.com"
_gh="github.com"
_host="https://${_gh}"
_ns='themartiancompany'
_local="${HOME}/${_pkgbase}"
url="${_host}/${_ns}/${_pkgbase}"
license=(
  AGPL3)
depends=(
  openssh
)
makedepends=()
checkdepends=(
  shellcheck)
provides=(
  "${_pkgbase}=${pkgver}")
conflicts=(
  "${_pkgbase}")
groups=(
 "${_proj}"
 "${_proj}-git"
)
_url="file://${HOME}/${_pkgbase}"
source=(
  "git+${url}"
  # "git+${_url}"
)
sha256sums=(
  SKIP
)

_parse_ver() {
  local \
    _pkgver="${1}" \
    _out="" \
    _ver \
    _rev \
    _commit
  _ver="$( \
    echo \
      "${_pkgver}" | \
      awk \
        -F '+' \
        '{print $1}')"
  _rev="$( \
    echo \
      "${_pkgver}" | \
      awk \
        -F '+' \
        '{print $2}')"
  _commit="$( \
    echo \
      "${_pkgver}" | \
      awk \
        -F '+' \
        '{print $3}')"
  _out=${_ver}
  if [[ "${_rev}" != "" ]]; then
    _out+=".r${_rev}"
  fi
  if [[ "${_commit}" != "" ]]; then
    _out+=".${_commit}"
  fi
  echo \
    "${_out}"
}

pkgver() {
  local \
    _pkgver
  cd \
    "${_pkgbase}"
  _pkgver="$( \
    git \
      describe \
      --tags | \
      sed \
        's/-/+/g')"
  _parse_ver \
    "${_pkgver}"
}

package() {
  cd \
    "${_pkgbase}"
  make \
    PREFIX="/usr" \
    DESTDIR="${pkgdir}" \
    install
}

# vim: ft=sh syn=sh et
