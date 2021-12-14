# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=spatialpandas
pkgname=python-${_base}
pkgver=0.4.3
pkgrel=2
pkgdesc="Pandas extension arrays for spatial/geometric operations"
arch=('any')
url="https://github.com/holoviz/${_base}"
license=('custom:BSD-2-clause')
depends=(python-fsspec python-numba python-pandas python-param python-pyarrow python-snappy python-retrying python-dask)
makedepends=(python-pyct python-setuptools)
# checkdepends=(python-pytest python-geopandas python-hypothesis python-shapely python-scipy) # python-hilbertcurve
source=(${_base}-${pkgver}::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7f6a6f8beb173e59768413751cede3eeac6a005290530ce4eb52eabfeec07a9c4fa5c03f2c2b621b19880155a98d4b89c269bc1ffda7bb28d6d298f2b00da479')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

# check() {
#   cd "${_base}-${pkgver}"
#   python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
#   PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest ${_base} -k "not pack_partitions_to_parquet and not pack_partitions_to_parquet_glob and not pack_partitions_to_parquet_list_bounds"
# }

package() {
  cd "${_base}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
