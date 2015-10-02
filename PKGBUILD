# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# From python-cement

set -u
_pyver="python"
_pybase='pathspec'
pkgname="${_pyver}-${_pybase}"
pkgver='0.3.3'
pkgrel='2'
pkgdesc='Utility library for gitignore style pattern matching of file paths'
arch=('any')
url='https://github.com/cpburnz/python-path-specification'
license=('custom') #MPL 2.0
makedepends=("${_pyver}" "${_pyver}-distribute") # same as python-setuptools
_srcdir="${_pybase}-${pkgver}"
_verwatch=("https://pypi.python.org/simple/${_pybase}/" "${_pybase}-\([0-9\.]\+\)\.tar\.gz" 't')
source=("https://pypi.python.org/packages/source/${_pybase: 0:1}/${_pybase}/${_pybase}-${pkgver}.tar.gz")
sha256sums=('38d0613ee2ce75adbbad61a33895c3b88122c768a732fb14800e6f660cc1380b')

build() {
  set -u
  cd "${_srcdir}"
  ${_pyver} setup.py build
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  # If pip is installed, some package tests download missing packages. We can't allow that.
  #${_pyver} setup.py test --verbose
  set +u
}

package() {
  set -u
  depends=("${_pyver}") # "${_pydepends[@]}")
  cd "${_srcdir}"
  ${_pyver} setup.py install --root="${pkgdir}"
  #install -Dpm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
