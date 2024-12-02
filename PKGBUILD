# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Liam Timms <timms5000@gmail.com>
# Contributor: Frank Fishburn <frankthefishburn@gmail.com>
_base=nilearn
pkgname=python-${_base}
pkgver=0.11.0
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
sha512sums=('98dd40ab73c7401695578feb8309eef74d4a1862e9ec6038661d23dd8bfa0af70d4a09469a65d9c2be2d77c49cad5af500858e82ffba1beee24e951c6396a96f')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation

}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
