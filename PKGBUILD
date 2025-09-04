# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Liam Timms <timms5000@gmail.com>
# Contributor: Frank Fishburn <frankthefishburn@gmail.com>
_base=nilearn
pkgname=python-${_base}
pkgver=0.12.1
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
sha512sums=('8618cd887d81288f46f0663efb558ce9c6c3c42eeb3dca7e1c61d27e72be1a63efb0bbb817de2d862ab148cf23bf99c798e00a144f8ad7a5807d6ecd733d8a33')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation

}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
