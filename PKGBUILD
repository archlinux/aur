# $Id$
# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Fordham <chris [at] fordham-nagy [dot] id [dot] au>
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/python-bcdoc/PKGBUILD

set -u
_pyver="python"
_pybase='bcdoc'
pkgname="${_pyver}-${_pybase}"
pkgver='0.14.0'
pkgrel='2'
pkgdesc='Tools to help document botocore-based projects.'
arch=('any')
url="https://github.com/boto/${_pybase}"
license=('Apache') # Apache License 2.0
makedepends=("${_pyver}" "${_pyver}-distribute") # same as python-setuptools
_srcdir="${_pybase}-${pkgver}"
_verwatch=("${url}/releases" "${url#*github.com}/archive/\(.*\)\.tar\.gz" 'l')
source=("${_pybase}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('f39a87c8667a059503d2dde24d7bfe181b8d863cb7e2aa993f2561ff15683aa4')

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
  ${_pyver} setup.py install --root="${pkgdir}" --optimize=1
  #install -Dpm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
