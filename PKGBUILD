# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PyOP2
pkgname=python-${_base,,}
pkgdesc="Framework for performance-portable parallel computations on unstructured meshes"
pkgver=20240502.0
pkgrel=1
arch=(x86_64)
url="https://github.com/${_base:2:4}/${_base}"
license=(BSD-3-Clause)
depends=(petsc python-decorator python-mpi4py python-pytools)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
source=(${url}/archive/Firedrake_${pkgver}.tar.gz)
sha512sums=('8ee32c9ff514562d39a318191511c675f41609c4f0a59879f168b9713fc711a3d7cc0a4a5fb2aa08053e6df054bcde3cb7f2cf39b542cc3fa427c856da90ec15')

build() {
  cd ${_base}-Firedrake_${pkgver}
  source /etc/profile.d/petsc.sh
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-Firedrake_${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
