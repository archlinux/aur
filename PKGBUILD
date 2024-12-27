# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=jupyprint
pkgname=python-${_base}
pkgdesc="A simple python package to print markdown and LaTeX equations from code cells in Jupyter notebooks"
pkgver=0.1.6
pkgrel=1
arch=(any)
url="https://github.com/pxr687/${_base}"
license=(MIT)
depends=(python-pandas ipython)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('fcca5f4bef2288041e979944adba1f443c7270215b9389e759677c50786d075f30e54f4e9a7e18e45e1578b54b7348d1f42c9dae02a58633746511e8326fcede')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${_base}"
}
