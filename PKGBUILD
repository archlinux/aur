# $Id$
# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Fordham <chris [at] fordham-nagy [dot] id [dot] au>
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/python-bcdoc/PKGBUILD

set -u
_pybase='bcdoc'
_pyver="python2"
pkgname="${_pyver}-${_pybase}"
pkgver='0.12.2'
pkgrel='1'
pkgdesc='Tools to help document botocore-based projects.'
arch=('any')
url="https://github.com/boto/${_pybase}"
license=('Apache') # Apache License 2.0
makedepends=("${_pyver}" "${_pyver}-distribute") # same as python-setuptools
_srcdir="${_pybase}-${pkgver}"
#_verwatch=("${url}/releases" "${url#*github.com}/archive/\(.*\)\.tar\.gz" 'l')
source=("${_pybase}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('f1dc05496a5caa32a1e2ce8c7e02c39862ae2786552be5c2e10f9e5aa49e7d37')

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
  depends=("${_pyver}") #"${_pydepends[@]}")
  cd "${_srcdir}"
  ${_pyver} setup.py install --root="${pkgdir}" --optimize=1
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
