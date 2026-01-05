# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Liam Timms <timms5000@gmail.com>
# Contributor: Frank Fishburn <frankthefishburn@gmail.com>
_base=nilearn
pkgname=python-${_base}
pkgver=0.13.0
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
sha512sums=('03f1cca5a4983a096c6f58745d35bdf4da4d0be6533d1c23d00bac6a79bf007b142ce6d518fdfe0793e9ac7126a703d9d82d8deb44435711721dc1cd1159d0b9')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation

}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
