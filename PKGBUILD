# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=flowdyn
pkgname=python-${_base}
pkgdesc="Model of discretization of hyperbolic model, base is Finite Volume method"
pkgver=1.4.0
pkgrel=1
arch=(any)
url="https://github.com/jgressier/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-poetry-core python-wheel)
optdepends=('python-aerokit' 'python-matplotlib')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('74378a9902e06fe086a77e851dd7a3873efb91dbcdff44ec53841d224ec7cef6db13c061af447df57f63b7ed2431a0e1f3cd4c2a52d2b6800881303717920b9a')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
