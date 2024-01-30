# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Ryan Coyner <rcoyner@gmail.com>

_pkg="soappy"
_Pkg="SOAPpy"
_py3="python"
_py="python2"
pkgbase="${_py3}-soappy"
pkgname="${_py}-soappy"
pkgver=0.12.22
pkgrel=3
_pkgdesc=(
  "A module which implements an high-level"
  "interface to SOAP functions"
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  'any'
)
url="http://pywebsvcs.sourceforge.net/"
license=(
  'custom'
)
makedepends=(
  "${_py}-setuptools"
)
conflicts=(
  "${_py3}-soappy<=0.12.0-10"
)
replaces=(
  "${_py}-soappy<=0.12.0-10"
)
_pypi="https://pypi.python.org/packages/source"
_http="https://raw.githubusercontent.com"
_ns="kiorky"
_url="${_http}/${_ns}/${_Pkg}"
source=(
  "${_pypi}/${_Pkg::1}/${_Pkg}/${_Pkg}-${pkgver}.zip"
  "${pkgbase}-LICENSE::${_url}/develop/LICENSE"
)
sha512sums=(
  'd75d0bf8e88c8ecae57f51a201f9ab6f24fc41856ee2093e7e2e73e5d8618c9a766a69140df28a24b6d8493b53555c09502684c6d2fd78e90a3c53bba52f388b'
  '6b05765063f199eb609bca929457e348a6936ad8b65c7d0004772cfc29a75bc77a73a6f4c2d0c9bd9e97b28e78ac565dede5a395e775be4c27fd0f50990a127e')

build() {
  cd \
    "${_Pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      build
}

package_python2-soappy() {
  depends=(
    "${_py}-wstools"
    "${_py}-defusedxml"
  )
  optdepends=(
    "${_py}-m2crypto: for support for server-side SSL"
  )
  cd \
    "${_Pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}" \
        --optimize=1
  install \
    -Dm644 \
    "../${pkgbase}-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=-1 et:
