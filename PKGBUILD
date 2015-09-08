# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pyver="python2"
_pybase='cement'
pkgname="${_pyver}-${_pybase}"
pkgver='2.6.2'
pkgrel='1'
pkgdesc='CLI Application Framework for Python'
arch=('any')
#url="https://pypi.python.org/pypi/${_pybase}/"
url='http://builtoncement.com/'
license=('Apache2') #custom: ISC
makedepends=("${_pyver}" "${_pyver}-distribute") # same as python-setuptools
_srcdir="${_pybase}-${pkgver}"
#_verwatch=("https://pypi.python.org/simple/${_pybase}/" "${_pybase}-\([0-9\.]\+\)\.tar\.gz" 't')
source=("http://pypi.python.org/packages/source/${_pybase: 0:1}/${_pybase}/${_pybase}-${pkgver}.tar.gz")
sha256sums=('ba547b342c2e327f2509f9424971f7ae9dd61ec884cb62c80f45d88bdf4bd27b')

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
  install -Dpm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u
# vim:set ts=2 sw=2 et:
