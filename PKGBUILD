# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=meshpy
pkgname=python-${_base}
pkgdesc="Triangular and Tetrahedral Mesh Generator"
pkgver=2025.1.1
pkgrel=1
arch=(x86_64)
url="https://documen.tician.de/${_base}"
license=(MIT)
depends=(python-numpy)                                                # boost
makedepends=(python-build python-installer meson-python pybind11 git) # ctags
checkdepends=(python-pytest)                                          # python-matplotlib
source=("git+https://github.com/inducer/${_base}.git?signed#tag=v${pkgver}")
validpgpkeys=('900A958D9A0ACA58B1468F2471AA298BCA171145') # Andreas Kloeckner
sha512sums=('d97f56f1497861c5170536ac4b105ba4d299bdb1ae54747b10393e9ab3ab8a184ee1cb66baae0e242a7184b076143c991ac72e78925630cc8f53ae4dc3761288')

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}{sys.version_info.minor}')")
#   PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${_pyversion}:${PYTHONPATH}" python test/test_meshpy.py
# }

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
