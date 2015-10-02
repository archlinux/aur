# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pybase='blessed'
_pyver="python"
pkgname="${_pyver}-${_pybase}"
pkgver='1.9.5'
pkgrel='2'
pkgdesc='A thin, practical wrapper around terminal capabilities in Python'
arch=('any')
#url="https://pypi.python.org/pypi/${_pybase}/"
url="https://github.com/jquast/${_pybase}"
license=('MIT')
_pydepends=("${_pyver}-wcwidth>=0.1.0")
makedepends=("${_pyver}" "${_pyver}-distribute") # same as python-setuptools
_srcdir="${_pybase}-${pkgver}"
_verwatch=("https://pypi.python.org/simple/${_pybase}/" "${_pybase}-\([0-9\.]\+\)\.tar\.gz" 't')
source=("http://pypi.python.org/packages/source/${_pybase: 0:1}/${_pybase}/${_pybase}-${pkgver}.tar.gz")
sha256sums=('b93b5c7600814638c0913c8325608327a24e3731977d9a4f003ecf37b08ca6e5')

build() {
  set -u
  cd "${_srcdir}"
  ${_pyver} setup.py build
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  # Very slow.
  # If pip is installed, some package tests download missing packages. We can't allow that.
  #${_pyver} setup.py test --verbose
  set +u
}

package() {
  set -u
  depends=("${_pyver}" "${_pydepends[@]}")
  cd "${_srcdir}"
  ${_pyver} setup.py install --root="${pkgdir}"
  install -Dpm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u
# vim:set ts=2 sw=2 et:
