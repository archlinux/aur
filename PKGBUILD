# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkg=trustme
_py="python2"
pkgname="${_py}-${_pkg}"
_name=${pkgname#python2-}
pkgver=0.9.0
pkgrel=5
_pkgdesc=(
  'Library for fake certificate authority (CA)'
  'to generate fake TLS certs (Python 2 package)'
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  'any'
)
url="https://pypi.org/project/${_pkg}/${pkgver}/"
license=(
  'MIT'
)
depends=(
  "${_py}"
  "${_py}-cryptography"
  "${_py}-idna"
)
makedepends=(
  'python2-setuptools'
)
checkdepends=(
  "${_py}-pyopenssl"
  "${_py}-pytest"
  "${_py}-service-identity"
)
_tarname="${_name}-${pkgver}"
_http="https://github.com"
_ns="python-trio"
_url="${_http}/${_ns}/${_pkg}"
source=(
  "${_tarname}::${_url}/archive/refs/tags/v${pkgver}.tar.gz"
)
b2sums=(
  '970700274ac25b9871b53bba4ddbac2d22bb9db672012fd1216726091c39fd901023c93b9c1b49cb2f90a9610f7f64d76ef9c9a1509282f9bbc944d56a352ff2'
)

build() {
  cd \
    "${_tarname}"
  "${_py}" \
    setup.py \
    build
}

check() {
  cd \
    "${_tarname}"
  export \
    PYTHONPATH=$(pwd)
  py.test2 || \
  pytest2
}

package() {
  cd \
    "${_tarname}"
  "${_py}" \
    setup.py \
     install \
       -O1 \
       --root="${pkgdir}" \
       --skip-build
  install \
    -Dm 644 \
    LICENSE.MIT \
    -t \
    "${pkgdir}/usr/share/licenses/${pkgname}"
  install \
    -Dm 644 \
    README.rst \
    -t \
    "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set sw=2 sts=-1 et:
