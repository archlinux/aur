# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Peter Oehme <oehme.pb at gmail dot com>
_base=pymor
pkgname=python-${_base}
pkgver=2025.2.1
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
sha512sums=('e714f602a84222151a7d38941ce2e0f01ed1fc68045ec16131699b16e3bde3f2d93f5f9a10b6a78366fb222c92a47046b25831fc9d5e3ca4aaf3d8b75263d495')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
