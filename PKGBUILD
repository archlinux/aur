# $Id$
# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Fordham <chris [at] fordham-nagy [dot] id [dot] au> aka flaccid
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/python-jmespath/PKGBUILD

set -u
_pyver="python2"
_pybase='jmespath'
pkgname="${_pyver}-${_pybase}"
pkgver='0.7.1'
pkgrel='1'
pkgdesc='allows you to declaratively specify how to extract elements from a JSON document.'
arch=('any')
#url="https://pypi.python.org/pypi/${_pybase}/"
url="https://github.com/boto/${_pybase}"
license=('Apache') # Apache License 2.0
makedepends=("${_pyver}" "${_pyver}-distribute") # same as python-setuptools
_srcdir="${_pybase}.py-${pkgver}"
#_verwatch=("${url}/releases" "${url#*github.com}/archive/\(.*\)\.tar\.gz" 'l')
source=("${_pybase}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('7d158a87b3629e216f6169409380801d7b1f7d2313485dcc20069882314ce9f9')

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
  install -Dpm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
