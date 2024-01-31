# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_py="python2"
_pkg="wstools"
pkgname="${_py}-${_pkg}"
pkgver=0.4.10
pkgrel=6
_pkgdesc=(
  "WSDL parsing services package"
  "for Web Services for Python"
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  'any'
)
_ns="pycontribs"
_http="https://github.com"
url="${_http}/${_ns}/${_pkg}"
license=(
  'custom'
)
depends=(
  "${_py}-six"
)
makedepends=(
  "${_py}-pbr"
  "${_py}-setuptools"
)
checkdepends=(
  'autopep8'
  "${_py}-pytest-runner"
  "${_py}-pytest-cov"
)
source=(
  "${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
  # python310.patch
)
sha512sums=(
  '1acd8e62d71c7d330f1e953a0da1956291c5dfb25ff9b8b8799c83feaa4230e384955735b131bab7b430b92ae6c18498927d416d2d1e11fb5c5dad93417c671a'
  # 'd1eb690578eaf7f5e79d9dbc0494b545d88e124e11f9927c5c17c9e64b7cba209fbe5ad68b43afd84c850d22c36133e39e305d214ea55e8a7935e06a465f8947'
)

export \
  PBR_VERSION="${pkgver}"

prepare() {
  cd \
    "${_pkg}-${pkgver}"
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
  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}" \
        --optimize=1

  install \
    -d \
    "${pkgdir}/usr/share/licenses/${pkgname}"
  install \
    -Dm644 \
    docs/* \
    "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set sw=2 sts=-1 et:
