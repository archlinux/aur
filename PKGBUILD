# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=meshpy
pkgname=python-${_base}
pkgdesc="Triangular and Tetrahedral Mesh Generator"
pkgver=2026.1.1
pkgrel=1
arch=(x86_64)
url="https://documen.tician.de/${_base}"
license=(MIT)
depends=(python-numpy)                                                # boost
makedepends=(python-build python-installer meson-python pybind11 git) # ctags
checkdepends=(python-pytest)                                          # python-matplotlib
source=("git+https://github.com/inducer/${_base}.git?signed#tag=v${pkgver}")
validpgpkeys=('900A958D9A0ACA58B1468F2471AA298BCA171145') # Andreas Kloeckner
sha512sums=('b01669336f2663457e32c21d18e4cc58eae4dfc887d85321e12b6412a6cb31b65b1b522335703ce4aba4db1c71cd06799bf98f2c6f7ef93a2e689bd198f772f8')

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
