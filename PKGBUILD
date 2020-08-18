# $Id$
# Maintainer: Chris Severance aur.severach AatT spamgourmet.com

set -u
_pyver="python2"
_pybase='s3transfer'
pkgname="${_pyver}-${_pybase}"
pkgver='0.3.3'
pkgrel='1'
pkgdesc='Amazon S3 Transfer Manager for Python for aws'
arch=('any')
url="https://github.com/boto/${_pybase}"
license=('Apache') # Apache License 2.0
_pydepends=( # See setup.py, README.rst, and requirements.txt for version dependencies
  "${_pyver}-botocore"{'>=1.12.36','<2.0a.0'} # AUR
)
if [ "${_pyver}" = 'python2' ]; then
  _pydepends+=('python2-futures')
fi
depends=("${_pyver}" "${_pydepends[@]}")
makedepends=("${_pyver}" "${_pyver}-distribute") # same as python-setuptools
_srcdir="${_pybase}-${pkgver}"
#_verwatch=("${url}/releases.atom" '\s\+<title>\([^<]\+\)</title>.*' 'f') # RSS
source=("${_pybase}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('9f90989a42a0f02f388d15928aa96c5f')
sha256sums=('0c8b0f7aaf32173d1475df0a453bfdc37be8207ea15c1d8415a590ef3986fc51')

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
  #depends=("${_pyver}") # "${_pydepends[@]}")
  cd "${_srcdir}"
  ${_pyver} setup.py install --root="${pkgdir}" --optimize=1
  #install -Dpm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
