# Maintainer: Chris Severance aur.severach AatT spamgourmet.com

# This package is not python3 compatible.

set -u
_pyver="python2"
_pyverother='python python2 '
_pyverother="${_pyverother//${_pyver} /}"
_pyverother="${_pyverother// /}"
_pybase='pcapy'
pkgname="${_pyver}-${_pybase}"
pkgver='0.10.10'
pkgrel='1'
pkgdesc='interfaces with the libpcap packet capture library'
arch=('any')
url="https://github.com/CoreSecurity/${_pybase}"
license=('Apache') # Apache Version 1.1 (modified)
makedepends=("${_pyver}" "${_pyver}-distribute") # same as python-setuptools
_srcdir="${_pybase}-${pkgver}"
_verwatch=("${url}/releases" "${url#*github.com}/archive/\(.*\)\.tar\.gz" 'l')
source=("${_pybase}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ec07b47853b088f10814727ca316a62438e572b4bbf956a1adf7206e8dec7268')

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
  conflicts=("${_pyverother}-${_pybase}")
  cd "${_srcdir}"
  ${_pyver} setup.py install --root="${pkgdir}" #--optimize=1
  install -Dpm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
