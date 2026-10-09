# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=jupyprint
pkgname=python-${_base}
pkgdesc="A simple python package to print markdown and LaTeX equations from code cells in Jupyter notebooks"
pkgver=0.1.7
pkgrel=1
arch=(any)
url="https://github.com/pxr687/${_base}"
license=(MIT)
depends=(python-pandas ipython)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('1d67e1b2531ffde3a198ce1268b62a0143d53c661b5db4b6dc2f5d7a32792446899fa4e42943463b34a5f492821aed4368c84f2fc48dc08dc8036c2a172d7033')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${_base}"
}
