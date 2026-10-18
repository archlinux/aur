# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pybase='cement'
pkgname="python-${_pybase}"
pkgver='3.0.16'
#pkgver='2.8.2' # for aws-eb-cli
pkgrel='1'
pkgdesc='CLI application framework for Python'
arch=('any')
#url="https://pypi.python.org/pypi/${_pybase}/"
url='https://builtoncement.com/'
license=('Apache-2.0') #custom: ISC
depends=('python' 'python-yaml' 'python-tabulate' 'python-jinja')
makedepends+=('python-build' 'python-installer' 'python-wheel' 'python-setuptools') # PEP517
makedepends+=('python-pdm-backend')
#checkdepends=(
#  "python-pytest>=4.3.1"
#  "python-pytest-cov>=2.6.1"
#  "python-coverage>=4.5.3"
#  "python-mypy>=1.9.0"
#  "python-ruff>=0.3.2"
#  "python-mock>=5.1.0"
#)
_srcdir="${_pybase}-${pkgver}"
#_verwatch=("https://pypi.org/simple/${_pybase}/" "${_pybase}-\([0-9\.]\+\)\.tar\.gz" 't')
source=("https://pypi.io/packages/source/${_pybase: 0:1}/${_pybase}/${_pybase}-${pkgver}.tar.gz")
md5sums=('827f85a1808cc59afd7e2a36cc16a62a')
sha256sums=('7b56202c3c254dcf64aacdb6b3275a8fe08f50aac8a6c082d30d7860d490378e')

build() {
  local -; set -u
  cd "${_srcdir}"
  python -m build --wheel --no-isolation
}

package() {
  local -; set -u
  cd "${_srcdir}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dpm '644' 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dpm '644' 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
}
set +u
# vim:set ts=2 sw=2 et:
