# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Arvid Ephraim Picciani <aep@exys.org>
# Contributor: Michael Krauss <hippodriver@gmx.net>

# shellcheck disable=SC2034
_py="python2"
_pkg="pyparsing"
pkgbase="${_py}-${_pkg}"
pkgname=(
  "${pkgbase}"
)
pkgver=2.4.7
pkgrel=1
pkgdesc='General parsing module for Python'
arch=(
  'any'
)
_http="https://github.com"
url="${_http}/${_pkg}/${_pkg}"
makedepends=(
  "${_py}-setuptools"
)
license=(
  'MIT'
)
source=(
  "${url}/archive/${_pkg}_${pkgver}.tar.gz"
)
sha512sums=(
  'c7a546729f86a2b5176e2482b566b9fd715b03e495aaef4d720b21307bb03f385dbc849247f8d266cb3d92be0a83c34ce4995b655ce85318355d5a0d42d6991e'
)

build() {
  cd \
    "${_pkg}-${_pkg}_${pkgver}" || \
    exit
  "${_py}" \
    setup.py \
      build
}

check() {
  cd \
    "${_pkg}-${_pkg}_${pkgver}" || \
      exit
  "${_py}" \
    unitTests.py
}

# shellcheck disable=SC2154
package() {
  depends=(
    "${_py}"
  )
  cd \
    "${_pkg}-${_pkg}_${pkgver}" || \
    exit
  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}" \
        --optimize=1
  install \
    -Dm644 \
    LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set sw=2 sts=-1 et:
