# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pystencils
pkgname=python-${_base}
pkgdesc="Speeding up stencil computations on CPUs and GPUs"
pkgver=1.3.3
pkgrel=1
arch=(any)
url="https://i10git.cs.fau.de/pycodegen/${_base}"
license=(AGPL3)
depends=(python-sympy python-numpy python-appdirs python-joblib python-yaml)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
# checkdepends=(python-pytest-cov jupyter-nbconvert python-matplotlib python-blitzdb python-islpy python-pyevtk python-graphviz)
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
sha512sums=('df5ba798fdc4b42705bb25fc2ed78df8abf041cad540bf222c9f18cc6a4f7d189c7b21177a3c0e4bdce7b0e58e85dbb534220a43382349bfcb372a5d91814e77')

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
