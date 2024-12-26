# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pyver="python"
_pybase='cement'
pkgname="${_pyver}-${_pybase}"
pkgver='3.0.10'
#pkgver='2.8.2' # for aws-eb-cli
pkgrel='1'
pkgdesc='CLI Application Framework for Python'
arch=('any')
#url="https://pypi.python.org/pypi/${_pybase}/"
url='https://builtoncement.com/'
license=('Apache2') #custom: ISC
makedepends=("${_pyver}" "${_pyver}-distribute") # same as python-setuptools
_srcdir="${_pybase}-${pkgver}"
_verwatch=("https://pypi.org/simple/${_pybase}/" "${_pybase}-\([0-9\.]\+\)\.tar\.gz" 't')
source=("https://pypi.io/packages/source/${_pybase: 0:1}/${_pybase}/${_pybase}-${pkgver}.tar.gz")
md5sums=('26b81fc5c2c5f3c40d7fd093b2fbea58')
sha256sums=('73d1015ebf9b8df13e6bc987edf0d4be3f1c8b4438921eea8d66cbb5504aee15')

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
