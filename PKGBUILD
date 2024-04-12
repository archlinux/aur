# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=rasterio
pkgname=python-${_base}
pkgver=1.3.10
pkgrel=1
pkgdesc="Fast and direct raster I/O for use with Numpy and SciPy"
url="https://github.com/${_base}/${_base}"
license=(custom)
arch=(x86_64)
depends=(gdal python-affine python-attrs python-certifi python-cligj python-snuggs python-click-plugins)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
# checkdepends=(
#   openexr
#   cfitsio
#   hdf5
#   libheif
#   openjpeg2
#   libjxl
#   poppler
#   postgresql-libs
#   libwebp
#   netcdf
#   arrow
#   mariadb-libs
#   podofo
#   python-boto3
#   python-hypothesis
#   python-pytest
#   python-shapely
#   python-matplotlib
# )
optdepends=('ipython: for ipython support'
  'python-boto3: for s3 support'
  'python-matplotlib: for plotting support'
  'python-swiftclient: for OpenStack support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('ff4ff5b1d67824669d4ec21e6fe1368ff05b00644c341392ee1807752536f4f77d3fbb13fd61aacd6943563ea24211fe9cad99609da20c58c42fa696df38f6eb')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   mv ${_base} .${_base}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest -m "not wheel" -rxXs tests -k 'not reproject_view and not reproject_nodata[options0-6644] and not reproject_nodata_nan[options1-6644] and not reproject_nodata[options1-6644] and not reproject_nodata_nan[options0-6644] and not reproject_dst_nodata_default[options0-6644] and not reproject_dst_nodata_default[options1-6644]' # py.test
# }

package() {
  cd ${_base}-${pkgver}
  # mv .${_base} ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
