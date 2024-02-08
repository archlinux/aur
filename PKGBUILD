# SPDX-License-Identifier: AGPL-3.0
#
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer:  Truocolo <truocolo@aol.com>
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

_py="python2"
_pkg="futures"
_Pkg="python${_pkg}"
pkgname="${_py}-${_pkg}"
_pkgname=futures
pkgver=3.3.0
pkgrel=3
_pkgdesc=(
  "Backport of the concurrent.futures"
  "package from Python 3.2"
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  'any'
)
_ns="agronholm"
_http="http://github.com"
url="${_http}/${_ns}/${_Pkg}"
license=(
  'PSF'
)
depends=(
  "${_py}"
)
makedepends=(
  "${_py}-setuptools"
)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
)
sha256sums=(
  '0e2f48368adfa176311654ef85e9010b6ce785b407d5dc9d1f04d248bd18f87e'
)

check() {
  cd \
    "${_Pkg}-${pkgver}"
  "${_py}" \
    setup.py \
    test
}

build() {
  cd \
    "${_Pkg}-${pkgver}"
  "${_py}" \
    setup.py \
    build
}

package() {
  cd \
    "${_Pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}" \
	--optimize=1 \
	--skip-build
  install \
    -Dm 644 \
    LICENSE \
    -t \
    "${pkgdir}/usr/share/licenses/${pkgname}"
  install \
    -Dm \
      644 \
    README.rst \
    -t \
   "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set sw=2 sts=-1 et:
