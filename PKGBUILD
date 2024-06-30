# SPDX-License-Identifier: AGPL-3.0
# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Oskar Roesler <oskar at oskar-roesler dot de>

_pkg="pycparser"
pkgname="${_pkg}"
pkgver=2.21
pkgrel=2
_py="python2"
pkgname="${_py}-${_pkg}"
_pkgdesc=(
  'C parser and AST generator'
  'written in Python'
)
pkgdesc="${_pkgdesc[*]}"
_ns="eliben"
_http="https://github.com"
url="${_http}/${_ns}/${_pkg}"
depends=(
  "${_py}-ply"
)
makedepends=(
  "${_py}-setuptools"
)
arch=(
  'any'
)
license=(
  'BSD'
)
source=(
  "$pkgname-$pkgver.tar.gz::${url}/archive/release_v${pkgver}.tar.gz"
)
sha512sums=(
  'b141e14040774ddaae6cd1726b0b2a61bfa76e8bcb5dc25dd99a303c48c7257dd7214cc7704234b0045ccc6a47354f6a7639647d875e1266846659217cc6ea78'
)

build() {
  cd \
    "${srcdir}/pycparser-release_v${pkgver}"
  "${_py}" \
    setup.py \
      build
  cd \
    "${_pkg}"
  "${_py}" \
    _build_tables.py
}

check() {
  cd \
    "${srcdir}/${_pkg}-release_v${pkgver}"
  "${_py}" \
    -m unittest \
      discover
}

package() {
  cd \
    "${_pkg}-release_v${pkgver}"

  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}" \
	--optimize=1
  install \
    -Dm644 \
    LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=-1 et:
