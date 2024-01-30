# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_py="python2"
_pkg="priority"
pkgname="${_py}-${_pkg}"
pkgver=2.0.0
pkgrel=4
_pkgdesc=(
  "A pure-Python implementation"
  "of the HTTP/2 priority tree"
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  'any'
)
license=(
  'MIT'
)
_http="https://github.com"
_ns="python-hyper"
url="${_http}/${_ns}/${_pkg}"
depends=(
  "${_py}"
)
makedepends=(
  "${_py}-setuptools"
)
checkdepends=(
  "${_py}-pytest-runner"
  "${_py}-hypothesis"
)
source=(
  "${url}/archive/v${pkgver}/python-${_pkg}-${pkgver}.tar.gz"
)
sha512sums=(
  'be22788a76049a8822f5a307f2b00948ac0555d0b6dd629686de90de482295806d071d1731bcdbfdc0f98abbb5aba7d2e947f478b479b72580e7ce1d19d684bb'
)

build() {
  cd \
    "${_pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      build
}

check() {
  cd \
    "${_pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      pytest
}

package() {
  cd \
    "${_pkg}-${pkgver}"
  "${_py}" \
    setup.py \
     install \
       --root="${pkgdir}" \
       --optimize=1
  install \
    -Dm644 \
    LICENSE \
    -t \
    "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set sw=2 sts=-1 et:
