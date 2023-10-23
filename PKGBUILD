# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pystencils
pkgname=python-${_base}
pkgdesc="Speeding up stencil computations on CPUs and GPUs"
pkgver=1.3.2
pkgrel=1
arch=(any)
url="https://i10git.cs.fau.de/pycodegen/${_base}"
license=(AGPL3)
depends=(python-sympy python-numpy python-appdirs python-joblib)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
# checkdepends=(python-pytest-cov jupyter-nbformat jupyter-nbconvert python-matplotlib python-blitzdb python-islpy)
optdepends=('python-cupy: for gpu support'
  'python-islpy: for alltrafos support'
  'python-py-cpuinfo: for alltrafos support'
  'python-blitzdb: for benchdb support'
  'python-pymongo: for benchdb support'
  'python-pandas: for benchdb support'
  'python-matplotlib: for interactive support'
  'python-ipy_table: for interactive support'
  'python-imageio: for interactive support'
  'jupyter-notebook: for interactive support'
  'python-pyevtk: for interactive support'
  'python-rich: for interactive support'
  'python-graphviz: for interactive support')
source=(${url}/-/archive/release/${pkgver}/${_base}-release-${pkgver}.tar.gz)
sha512sums=('92ae4d360ad6a8d10c8c90ca4f2f281f50262783573fb2fdd24cd8963174f9e4879fe8b01f3051da75704cb0928fa6409ca8c6e9d899e7b44b7dbe6fd7994265')

build() {
  cd ${_base}-release-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-release-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest
# }

package() {
  cd ${_base}-release-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
