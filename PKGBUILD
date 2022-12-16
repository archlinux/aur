# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=spatialpandas
pkgname=python-${_base}
pkgver=0.4.5
pkgrel=1
pkgdesc="Pandas extension arrays for spatial/geometric operations"
arch=(any)
url="https://github.com/holoviz/${_base}"
license=('custom:BSD-2-clause')
depends=(python-dask python-numba python-pandas python-param python-pyarrow python-snappy python-retrying)
makedepends=(python-pyct python-setuptools)
# checkdepends=(python-pytest python-geopandas python-hypothesis python-shapely python-scipy) # python-hilbertcurve
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a907c9c6cfb5b52beb014f94594b302ba6247b8f78739100062e99931e9d3223529dd80e97ce80b081801348341e04073cfe202e61c73c81bb83b3ced3ac04be')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

# check() {
#   cd "${_base}-${pkgver}"
#   python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
#   PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest ${_base} -k "not pack_partitions_to_parquet and not pack_partitions_to_parquet_glob and not pack_partitions_to_parquet_list_bounds"
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
