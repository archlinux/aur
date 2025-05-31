# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=outset
pkgname=python-${_base}
pkgdesc="add zoom indicators, insets, and magnified panels to matplotlib/seaborn visualizations with ease!"
pkgver=0.1.9
pkgrel=1
arch=(any)
url="https://github.com/mmore500/${_base}"
license=(MIT)
depends=(python-adjusttext python-frozendict python-opytional python-pandas python-seaborn)
makedepends=(python-build python-installer python-flit)
checkdepends=(python-pytest-cov python-slugify python-scikit-learn python-keras)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('aee6670ebd354bea4927975d3f1d9cda3920560ae6b2942c62b726751224d589116e0b3723907b7d243e18285e9547a6204324eb13edfc6dcdba35458cb1773b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
