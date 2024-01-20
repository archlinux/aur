# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkg=gcc
_pkgname="${_pkg}-11"
_arch="gnueabihf"
_rarch="androideabi"
pkgname="${_pkgname}-${_arch}-compat"
pkgver=1.0
pkgrel=1
pkgdesc="Symlink ${_rarch} GCC 11 to ${_arch}"
arch=(
  arm
)
url="http://gnu.org/gcc"
license=(
  AGPL3
)
depends=(
  gcc-11
)
makedepends=(
)
checkdepends=(
)
source=(
)
sha256sums=(
)

_find_bin() {
  dirname \
    "$(command \
        -v \
        "gcc")"
}

package() {
  local \
    _flowers=() \
    _bin \
    _filename
  mkdir \
    -p \
    "${pkgdir}/usr/bin"
  _flowers=(
    $(ls \
        "$(_find_bin)" | \
        grep \
          "${_rarch}")
  )
  for _bin \
    in "${_flowers[@]}"; do
    _filename="$( \
      basename \
        "${_bin}")"
    ln \
      -s \
      "${_bin}" \
      "${pkgdir}/usr/bin/$( \
        echo \
          "${_filename}" | \
          sed \
            "s%${_rarch}%${_arch}%g")"
  done
}

# vim:set sw=2 sts=-1 et:
