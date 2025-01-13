# Maintainer: Chris Severance aur.severach AatT spamgourmet.com

set -u
_pybase='parse_type'
pkgname="python-${_pybase}"
pkgver='0.6.4'
pkgrel='1'
pkgdesc='simplifies to build parse types based on the parse module'
arch=('any')
#url="https://pypi.python.org/pypi/${_pybase}/"
url='https://github.com/jenisys/parse_type'
license=('MIT')
_pydepends=( # See setup.py, README.rst, and requirements.txt for version dependencies
  'python-parse>=1.18.0'    # COM
  'python-six>=1.15'        # COM
)
depends=("python" "${_pydepends[@]}")
makedepends=('python-build' 'python-installer' 'python-wheel' 'git' 'python-setuptools-scm')
_srcdir="${_pybase}"
#_verwatch=("${url}/releases" "${url#*github.com}/archive/\(.*\)\.tar\.gz" 'l')
#source=("${_pybase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
#_verwatch=("https://pypi.org/simple/${_pybase//_/-}/" "${_pybase}-\([0-9\.]\+\)\.tar\.gz" 't')
#source=("https://pypi.io/packages/source/${_pybase: 0:1}/${_pybase}/${_pybase}-${pkgver}.tar.gz")
#source=("${_srcdir}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
source=("git+${url}.git#tag=v${pkgver}")
#https://github.com/jenisys/parse_type/archive/v0.5.6.tar.gz
md5sums=('9bc0fea0d3b54e9426c39becd223a64a')
sha256sums=('94b1007a121c990d96c880f40e0359d54066f732f4d01fd0134c3b02e4d160ff')

build() {
  set -u
  cd "${_srcdir}"
  python -m build --wheel --no-isolation
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dpm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
