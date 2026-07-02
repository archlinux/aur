# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Liam Timms <timms5000@gmail.com>
# Contributor: Frank Fishburn <frankthefishburn@gmail.com>
_base=nilearn
pkgname=python-${_base}
pkgver=0.14.0
pkgrel=1
pkgdesc="Python library for fast and easy statistical learning on NeuroImaging data"
arch=(any)
url="https://${_base}.github.io"
license=(BSD-4-Clause)
depends=(python-joblib python-lxml python-nibabel python-scipy python-pandas python-scikit-learn python-packaging)
makedepends=(python-build python-installer python-hatch-vcs python-wheel)
optdepends=('python-matplotlib: for general plotting'
  'python-plotly: for surface plotting'
  'python-kaleido: required if using plotly')
options=(!emptydirs)
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base}/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('0f79ae85f45bc67bbf7ae6321429e9a0157a10f06aa1b11867b6b1473e953e47c611849be06a01de4eba241c9eaafb8a49383a15365a5e972676fe53668fc7b7')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation

}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
