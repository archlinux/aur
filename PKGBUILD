# SPDX-License-Identifier: AGPL-3.0
#
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>

_pkg="idna"
_py="python2"
pkgname="${_py}-${_pkg}"
pkgver=2.10
pkgrel=4
_pkgdesc=(
  "Internationalized Domain Names"
  "in Applications (IDNA)"
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  'any'
)
license=(
  'BSD'
)
url="https://github.com/kjd/${_pkg}"
depends=(
  "${_py}"
)
makedepends=(
  "${_py}-setuptools"
)
_pypi="https://pypi.io/packages/source"
source=(
  "${_pypi}/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz"
)
sha512sums=(
  '83b412de2f79a4bc86fb4bdac7252521b9d84f0be54f4fb1bde1ee13a210bbfa4b1a98247affbc7921046fb117a591316c12694c1be72865767646554c5207ac'
)

prepare() {
  rm \
    -r \
    "${_pkg}-${pkgver}/"*".egg-info"
}

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
      test
}
 
package() {
  cd \
    "${_pkg}-${pkgver}"
  python2 \
    setup.py \
    install \
      --root="$pkgdir" \
      --optimize=1 \
      --skip-build
  install \
    -Dm644 \
    LICENSE.rst \
    -t \
    "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set sw=2 sts=-1 et:
