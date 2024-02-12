# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_git=false
_offline=false
_proj="hip"
_pkg="grub"
pkgname="arch-${_pkg}"
pkgver=0.1.1.1
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
url="${_http}/${_ns}/${pkgname}"
_local="file://${HOME}/${pkgname}"
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
    "${pkgname}::git+${_url}"
  ) && \
  sha256sums+=(
    'SKIP'
  )
[[ "${_git}" == false ]] && \
  source+=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  ) && \
  sha256sums+=(
    "e912d98095ff94d2c3098838782b73613512a9e9e7d8d0165343979be62310e7"
  )

check() {
  make \
    -k check \
    -C \
      "${pkgname}-${pkgver}"
}

# shellcheck disable=SC2134
package() {
  make \
    DESTDIR="${pkgdir}" \
    install \
      -C \
        "${pkgname}-${pkgver}"
}

# vim:set sw=2 sts=-1 et:
