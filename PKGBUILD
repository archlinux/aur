# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tcx2gpx
pkgname=python-${_base}
pkgdesc="Converts the Garmin tcx GPS file format to the more commonly used gpx file format"
pkgver=0.1.6
pkgrel=1
arch=(any)
url="https://gitlab.com/nshephard/${_base}"
license=(GPL-3.0-or-later)
depends=(python-gpxpy python-tcxparser python-tqdm)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest-cov)
source=(${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('32930f1ad6561debb035fb4ad27214503e915923c34533d906b82f8fbcf74a785f83575481911154c6894542d7eec0862e990b3fb4ca059eb517a99bc520e473')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
