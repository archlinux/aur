# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
_base=hvplot
pkgname=python-${_base}
pkgver=0.12.1
pkgrel=1
pkgdesc="A high-level plotting API for pandas, dask, xarray, and networkx built on HoloViews"
arch=(any)
url="https://${_base}.holoviz.org"
license=(BSD-3-Clause)
depends=(python-holoviews)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
# checkdepends=(python-pytest python-parameterized python-xarray python-matplotlib python-pooch
#   python-scipy python-plotly python-datashader python-dask python-geopandas) # python-netcdf4 python-streamz python-geoviews
optdepends=('python-xarray: for datetime handled as xarray data')
source=(${_base}-${pkgver}.tar.gz::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('4b980d317eb9f36bb05c54d77e1ac3bb43dc80785b30538f4473324109701f5ca8c50861f5f1812724275c33005222d8b4787844b37cfdbf9bf934e547251116')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   # https://stackoverflow.com/a/58440525/9302545
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest ${_base}/tests --ignore=${_base}/tests/testui.py
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
