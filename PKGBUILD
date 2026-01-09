# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Peter Oehme <oehme.pb at gmail dot com>
_base=pymor
pkgname=python-${_base}
pkgver=2025.2.0
pkgrel=1
pkgdesc="Library for building model order reduction applications with Python"
arch=(any)
url="https://${_base}.org"
license=(BSD-2-Clause BSD-3-Clause)
makedepends=(python-build python-installer python-hatchling python-wheel)
depends=(python-diskcache python-matplotlib python-packaging python-pillow
  python-pygments python-qtpy python-scipy python-threadpoolctl python-typer)
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
sha512sums=('99199f3e8f5a8dd9b4127fd527372b2031d8d4cd6cd9517720c60a5d2630fefa6fa2a907df16b439ea0900f4a62c53ee87d8b528d41a5b39ee527930384d65fa')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
