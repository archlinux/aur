# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Liam Timms <timms5000@gmail.com>
# Contributor: Frank Fishburn <frankthefishburn@gmail.com>
_base=nilearn
pkgname=python-${_base}
pkgver=0.12.0
pkgrel=1
pkgdesc="Python library for fast and easy statistical learning on NeuroImaging data"
arch=(any)
url="https://${_base}.github.io"
license=(BSD-4-Clause)
depends=(python-joblib python-lxml python-nibabel python-scipy python-pandas python-scikit-learn python-packaging)
makedepends=(python-build python-installer python-hatchling python-wheel)
optdepends=('python-matplotlib: for general plotting'
  'python-plotly: for surface plotting'
  'python-kaleido: required if using plotly')
options=(!emptydirs)
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base}/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('f15565ed793a89e86387928d001d99a9e9a7d57f9e776c87b655b54d4f0abeae1e5133e5c2fa87a735a7d7f41303045387c1787973ebbd6326874089f34cfa7a')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation

}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
