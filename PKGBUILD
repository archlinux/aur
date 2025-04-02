# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=loopy
pkgname=python-${_base}
pkgdesc="A code generator for array-based code on CPUs and GPUs"
pkgver=2025.1
pkgrel=1
arch=(x86_64)
url="https://github.com/inducer/${_base}"
license=(MIT)
depends=(python-pytools python-pymbolic python-genpy python-cgen python-islpy
  python-codepy python-colorama python-mako python-pyrsistent python-immutables)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-pyopencl)
optdepends=('python-pyopencl: for PyOpenCL support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('3db111d1d6417f157c5f819ec68d03bdb8e3b5dfddd86edbe23f3d95919eab922151cc6f7b49c15355b3ec1c383c8d83ea45f245ab948b70bed15a6c1a267fbb')

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
