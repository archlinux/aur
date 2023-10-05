# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pystencils
pkgname=python-${_base}
pkgdesc="Speeding up stencil computations on CPUs and GPUs"
pkgver=1.3.1
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
sha512sums=('a17fec089f5272f4d27f53fc8ee92842c5194953e11d099a29286dfbca8854257dd0cf3c645187436af484194e588b1c0c898f994826f04c6d963a229e715ea9')

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
