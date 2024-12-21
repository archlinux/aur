# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Peter Oehme <oehme.pb at gmail dot com>
_base=pymor
pkgname=python-${_base}
pkgver=2024.2.0
pkgrel=1
pkgdesc="Library for building model order reduction applications with Python"
arch=(any)
url="https://${_base}.org"
license=(BSD)
makedepends=(python-build python-installer python-hatchling python-wheel)
depends=(python-diskcache python-matplotlib python-packaging python-pillow python-pygments python-qtpy python-scipy python-typer)
optdepends=('python-pytorch: PyTorch open source machine learning framework'
  'python-slycot'
  'python-ipyparallel: required for ${_base}.parallel.ipython'
  'python-mpi4py'
  'pyside6: Provides LGPL Qt bindings for Python and related tools for binding generation (Python 3 version)'
  'python-opengl: fast solution visualization for builtin discretizations (PySide also required)'
  'python-ipympl'
  'python-ipywidgets: notebook GUI elements'
  'python-lxml'
  'python-meshio'
  'python-pyevtk'
  'python-xmljson'
  'gmsh'
  'python-scikit-fem'
)
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base}/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('b23d28fae6f96a28ad57b9f5ebde547c8bf1f749f2d2a0817a61a5ad2f10c9d5d4655fea23b160d1aaeb109b0d1a8b9294951bb49f42038d5b232bb299028441')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
