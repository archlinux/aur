# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Trougnouf (Benoit Brummer) <trougnouf@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Tarmo Heiskanen <turskii@gmail.com>

_py=python2
_pkg=flask
pkgname="${_py}-${_pkg}"
pkgver=1.1.4
pkgrel=1
pkgdesc='Micro webdevelopment framework for Python2'
url="http://${_pkg}.pocoo.org"
arch=('any')
license=('custom:BSD')
depends=(
  "${_py}-itsdangerous"
  "${_py}-jinja"
  "${_py}-setuptools"
  "${_py}-werkzeug"
)
makedepends=(
  "${_py}-itsdangerous"
  "${_py}-jinja"
  "${_py}-setuptools"
  "${_py}-werkzeug"
)
_tarname="${pkgname}-${pkgver}"
_repo_url="https://github.com/pallets/${_pkg}"
source=(
  "${_tarname}.tar.gz::${_repo_url}/archive/${pkgver}.tar.gz")
sha512sums=('e7ca33d599c0f7b83542620e827c999124ffe30e31006815b49993a81f9cf0d61dd0433b73f57f922da5aeb76101beccfe63d9a7236e1850e326f838dc1f453f')

build() {
  cd "${_pkg}-${pkgver}"
  "${_py}" setup.py build
}

check() {
  cd "${_pkg}-${pkgver}"
  "${_py}" setup.py test
}

package() {
  cd "${_pkg}-${pkgver}"

  "${_py}" setup.py install --prefix=/usr \
                            --root="${pkgdir}" \
                            --optimize=1
  mv "${pkgdir}/usr/bin/${_pkg}" "${pkgdir}/usr/bin/${_pkg}2"
  install -Dm644 LICENSE.rst \
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
}

# vim:set ts=2 sw=2 et:
