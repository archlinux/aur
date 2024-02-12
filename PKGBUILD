# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_git=false
_offline=true
_proj="hip"
_pkg="grub"
pkgname="arch-${_pkg}"
pkgver=0.1.1
pkgrel=1
_pkgdesc=(
  'Produces a standalone GRUB binary'
  'compatible with Arch Linux.'
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  'any'
)
license=(
  'AGPL3'
)
_gh="https://github.com"
_arch="https://gitlab.archlinux.org"
_arch_ns="tallero"
_gh_ns="themartiancompany"
_ns="${_gh_ns}"
_http="${_gh}"
url="${_http}/${_ns}/${_pkgname}"
_local="file://${HOME}/${_pkgname}"
depends=(
  "${_pkg}"
  bash
)
provides=(
  "mk${_pkg}=${pkgver}"
)
makedepends=(
  "make"
)
groups=(
  "${_proj}"
)
checkdepends=(
  'shellcheck'
)
optdepends=(
  'luks-tools: Format LUKS volume in a GRUB compatible format'  
)
sha256sums=()
source=()
_url="${url}.git"
_branch="master"
[[ "${_offline}" == true ]] && \
  _url="${_local}"
[[ "${_git}" == true ]] && \
  makedepends+=(
    'git'
  ) && \
  source+=(
    "${_pkgname}::git+${_url}"
  ) && \
  sha256sums+=(
    'SKIP'
  )
[[ "${_git}" == false ]] && \
  source+=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  ) && \
  sha256sums+=(
    "361cb9cea01287ac9ab16da17d13b86692dc67800754c5550e0b188e56fd0c78"
  )

check() {
  make \
    -k check \
    -C \
      "${pkgname}-${pkgver}"
}

# shellcheck disable=SC2134
package() {
  cd \
    "${pkgname}-${_pkgver}"
  make \
    DESTDIR="${pkgdir}" \
    install \
      -C \
        "${_pkgname}-${_pkgver}"
}

# vim:set sw=2 sts=-1 et:
