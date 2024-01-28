# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>
# Contributor: Kyle Keen <keenerd@gmail.com>

_py="python2"
_mod="shutil"
_fun="get_terminal_size"
_pkg="backports.${_mod}_${_fun}"
pkgname="${_py}-${_pkg}"
pkgver=1.0.0
pkgrel=5
pkgdesc="The ${_fun}() function from Python 3.3"
arch=(
  'any'
)
url="https://pypi.python.org/pypi/${_pkg}"
license=(
  'MIT'
)
depends=(
  "${_py}-backports"
)
makedepends=(
  "${_py}-setuptools"
)
_ns="chrippa"
_http="https://github.com/${_ns}"
_url="${_http}/${_pkg}"
source=(
  "${_url}/archive/v${pkgver}.tar.gz"
  "fix-fallback.patch::${_url}/commit/afc5714b.patch"
)
md5sums=(
  '82499a36a98dd7ed37c8678e6002a375'
  '071e696dba553fd4fcee24b1dfb8ef3a'
)

prepare() {
  cd \
    "${_pkg}-${pkgver}"
  # fix fallback size on Linux
  patch \
    -p1 \
    -i \
    ../fix-fallback.patch
}

package() {
  cd \
    "$srcdir/${_pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      install \
        --prefix=/usr \
	--root="${pkgdir}" \
	--optimize=0
  rm \
    "${pkgdir}/usr/lib/${_py}.7/site-packages/backports/__init__.py"*
  install \
    -Dm644 \
    LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=-1 et:
