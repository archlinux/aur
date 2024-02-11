# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_py="python"
_py2="${_py}2"
_pkgname=luks-tools
pkgname="${_pkgname}-git"
pkgver=0.0.0.0.0.1.r1.g84fb4c0
pkgrel=1
pkgdesc="A collection of LUKS related scripts."
arch=(
  any
)
_repo="https://github.com"
_ns="themartiancompany"
url="${_repo}/${_ns}/${_pkgname}"
license=(
  AGPL3
)
depends=(
  bash
)
makedepends=(
  git
)
optdepends=(
)
provides=(
  "${_pkgname}=${pkgver}")
conflicts=(
  "${_pkgname}")
_url="file://${HOME}/${_pkgname}"
_branch="master"
source=(
  "git+${url}"
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
  [[ "${_rev}" != "" ]] && \
    _out+=".r${_rev}"
  [[ "${_commit}" != "" ]] && \
    _out+=".${_commit}"
  echo \
    "${_out}"
}

pkgver() {
  local \
    _pkgver
  cd \
    "${_pkgname}"
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
    "${_pkgname}"
  make \
    DESTDIR="${pkgdir}" \
    install
}

# vim: ft=sh syn=sh et
