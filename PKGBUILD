# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=loopy
pkgname=python-${_base}
pkgdesc="A code generator for array-based code on CPUs and GPUs"
pkgver=2025.2
pkgrel=1
arch=(x86_64)
url="https://github.com/inducer/${_base}"
license=(MIT)
depends=(python-pytools python-pymbolic python-genpy python-cgen python-islpy
  python-codepy python-colorama python-mako python-constantdict python-typing_extensions)
makedepends=(python-build python-installer python-hatchling python-wheel)
# checkdepends=(python-pytest python-pyopencl)
optdepends=('python-pyopencl: for PyOpenCL support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d5d9a3d80e57560c954ba6107f7bd3a9642cd0b10f7a9011947c5042f702747002ac5664a3d10500cdeb0064a9ed1934757c19fd15be92f9f47435fc306558cf')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   # https://gitlab.archlinux.org/archlinux/packaging/packages/python-pyopencl/-/blob/main/PKGBUILD?ref_type=heads#L30
#   checkdepends+=('intel-opencl-runtime')
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   PYOPENCL_TEST=intel test-env/bin/python -m pytest test
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
