# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

_py="python2"
_py3="python"
_pkg="tomli-w"
pkgname="${_py}-${_pkg}"
pkgver=1.0.0
pkgrel=6
pkgdesc="A lil' TOML writer"
_http="https://github.com"
_ns="hukkin"
url="${_http}/${_ns}/${_pkg}"
license=(
  MIT
)
arch=(
  any
)
depends=(
  "${_py}"
)
makedepends=(
  git
  # "${_py}-build"
  # "${_py}-flit-core"
  # "${_py}-installer"
)
checkdepends=(
  # "${_py}-pytest"
  "${_py3}-pytest"
  "${_py3}-tomli"
)
_tag=19099125f32e7c491603e393263754262b356956
source=(
  "git+${url}.git#tag=${_tag}"
)
b2sums=(
  SKIP
)

pkgver() {
  cd \
    "${_pkg}"
  git \
    describe \
    --tags
}

build() {
  cd "${_pkg}"
  "${_py}" \
    -m \
      build \
      --wheel \
      --no-isolation
}

check() {
  cd \
    "${_pkg}"
  "${_py}" \
    -m \
      pytest
}

package() {
  "${_py}" \
    -m \
      installer \
      --destdir="${pkgdir}" \
      "${_pkg}/dist/"*".whl"
  install \
    -Dm 644 \
    "${_pkg}/LICENSE" \
    -t \
    "${pkgdir}/usr/share/licenses/${_pkg}"
}

# vim:set sw=2 sts=-1 et:
