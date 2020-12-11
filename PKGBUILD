# Maintainer: Chris Severance aur.severach AatT spamgourmet.com

set -u
_pyver="python2"
_pybase='parse_type'
pkgname="${_pyver}-${_pybase}"
pkgver='0.5.6'
pkgrel='1'
pkgdesc='simplifies to build parse types based on the parse module'
arch=('any')
#url="https://pypi.python.org/pypi/${_pybase}/"
url='https://github.com/jenisys/parse_type'
license=('BSD')
_pydepends=( # See setup.py, README.rst, and requirements.txt for version dependencies
  "${_pyver}-parse>=1.6"    # COM
  "${_pyver}-six"           # COM
)
depends=("${_pyver}" "${_pydepends[@]}")
makedepends=("${_pyver}" "${_pyver}-distribute") # same as python-setuptools
_srcdir="${_pybase}-${pkgver}"
#_verwatch=("${url}/releases" "${url#*github.com}/archive/\(.*\)\.tar\.gz" 'l')
#source=("${_pybase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
#_verwatch=("https://pypi.org/simple/${_pybase//_/-}/" "${_pybase}-\([0-9\.]\+\)\.tar\.gz" 't')
#source=("https://pypi.io/packages/source/${_pybase: 0:1}/${_pybase}/${_pybase}-${pkgver}.tar.gz")
source=("${_srcdir}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
#https://github.com/jenisys/parse_type/archive/v0.5.6.tar.gz
md5sums=('872136263b915e051115669b4467876e')
sha256sums=('12b75aa048595457fa5d15558c1a49a688ad4a585d5d1378b1aff4d99fb532ae')

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
  cd "${_srcdir}"
  ${_pyver} setup.py install --root="${pkgdir}"
  install -Dpm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
