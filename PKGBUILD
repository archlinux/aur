# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

# shellcheck disable
_py="python2"
_pkg="appdirs"
pkgname=(
  "${_py}-${_pkg}"
)
pkgver=1.4.4
pkgrel=6
_pkgdesc=(
  'A small Python module for determining'
  'appropriate platform-specific dirs,'
  'e.g. a "user data dir".'
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  'any'
)
url="https://github.com/ActiveState/${_pkg}"
license=(
  'MIT'
)
makedepends=(
  "${_py}-setuptools"
)
_pypi="https://pypi.io/packages/source"
_url="${_pypi}/${_pkg[1]}/${_pkg}/${_pkg}-${pkgver}.tar.gz"
source=(
  "${_url}"
)
sha512sums=(
  '8b0cdd9fd471d45b186aa47607691cf378dabd3edc7b7026a57bd6d6f57698e86f440818a5e23ba4288b35d6bb8cb6eb0106eae8aab09d8863ee15025d300883'
)

prepare() {
  cp \
    -a \
    "${_pkg}-${pkgver}"{,-py2}
}

build() {
  cd \
    "${srcdir}/${_pkg}-${pkgver}-py2"
  "${_py}" \
    setup.py \
      build
}

check() {
  cd \
    "${srcdir}/${_pkg}-${pkgver}-py2"
  "${_py}" \
    setup.py \
      test
}

package() {
  depends=(
    "${_py}"
  )
  cd \
    "${_pkg}-${pkgver}-py2"
  "${_py}" \
    setup.py \
      install \
      --root="${pkgdir}/" \
      --optimize=1
  install \
    -Dm644 \
    LICENSE.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set sw=2 sts=-1 et:
