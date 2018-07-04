# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Fordham <chris [at] fordham-nagy [dot] id [dot] au> aka flaccid
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/python-rsa-3.1.2/PKGBUILD

set -u
_pyver="python"
_pyverother='python python2 '
_pyverother="${_pyverother//${_pyver} /}"
_pyverother="${_pyverother// /}"
_pybase='rsa'
_pkgname="${_pyver}-${_pybase}"
pkgname="${_pkgname}-3.1.2"
pkgver='3.1.2'
pkgrel='1'
pkgdesc='Pure-Python RSA implementation. Old version for aws & botocore.'
arch=('any')
#url="https://pypi.python.org/pypi/${_pybase}/"
url='https://stuvel.eu/rsa'
license=('BSD')
makedepends=("${_pyver}" "${_pyver}-distribute") # same as python-setuptools
_srcdir="${_pybase}-${pkgver}"
#_verwatch=("https://pypi.org/simple/${_pybase}/" "${_pybase}-\([0-9\.]\+\)\.tar\.gz" 't')
source=("https://pypi.python.org/packages/source/${_pybase: 0:1}/${_pybase}/${_pybase}-${pkgver}.tar.gz")
sha256sums=('66eb8752a1de9b92d7679ea0e1556cf2e4a155161d0024e97e06999041e35f58')

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
  provides=("${_pkgname}=${pkgver}")
  conflicts=("${_pkgname}" "${_pyverother}-${_pybase}")
  depends=("${_pyver}") # "${_pydepends[@]}")
  cd "${_srcdir}"
  ${_pyver} setup.py install --root="${pkgdir}" --optimize=1
  install -Dpm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u
# vim:set ts=2 sw=2 et:
