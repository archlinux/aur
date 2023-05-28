# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=apricot-select
pkgname=python-${_base}
pkgver=0.6.1
pkgrel=1
pkgdesc="A package for submodular selection of representative sets for machine learning models"
arch=(x86_64)
url="https://github.com/jmschrei/${_base::7}"
license=(MIT)
depends=(python-scipy python-numba python-tqdm python-scikit-learn)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('cc445cda704059d0666140f1882e49264e524719f4eb0f9807ba97d34be85864ecf919691175282e3fce3411ed5e1ba4ffee9ab6356e5ca7adc812c1fc117dc3')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
