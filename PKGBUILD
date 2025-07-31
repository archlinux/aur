# Maintainer: Kherim Willems <aur@kher.im>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname_pypi=pdb2pqr
pkgname="python-${_pkgname_pypi}"
pkgver=3.7.1
pkgrel=1
pkgdesc="Automates many of the common tasks of preparing structures for continuum solvation calculations as well as many other types of biomolecular structure modeling, analysis, and simulation."
arch=('any')
url="http://pypi.python.org/pypi/${_name}"
license=('BSD-3-Clause')
depends=(
  'python>=3.10'
  'python-mmcif-pdbx'
  'python-numpy'
  'python-propka'
  'python-requests'
  'python-docutils'
  'python-typing_extensions'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
)
checkdepends=(
  'python-ruff'
  'python-coverage'
  'python-pandas>=1.0'
  'python-pytest'
  'python-testfixtures'
  'python-sphinx'
  'python-sphinx_rtd_theme'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname_pypi::1}/${_pkgname_pypi}/${_pkgname_pypi}-${pkgver}.tar.gz")
sha256sums=('05b5c464022a3ad11c9597c6fc7f70c56061c4669b1497a51958da90d959152f')
options=(!emptydirs !debug)

build() {
  cd "${srcdir}/${_pkgname_pypi}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname_pypi}-${pkgver}"
  PYTHONPATH="$PWD" pytest
}

package() {
  cd "${srcdir}/${_pkgname_pypi}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
