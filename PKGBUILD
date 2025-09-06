# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Peter Oehme <oehme.pb at gmail dot com>
_base=pymor
pkgname=python-${_base}
pkgver=2025.1.1
pkgrel=1
pkgdesc="Library for building model order reduction applications with Python"
arch=(any)
url="https://${_base}.org"
license=(BSD)
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
sha512sums=('c1fd11dd0d8599b04b2c9910c8613b61a16a1d9fe6cb73fecd4b569b8f2a583524892ed4fa21bb003dfd0e5c14d564e4636dbc66d666227b61d78fba7a62d0e9')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
