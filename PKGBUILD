# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=rasterio
pkgname=python-${_base}
pkgver=1.3.3
pkgrel=1
pkgdesc="Rasterio reads and writes geospatial raster datasets"
url="https://github.com/${_base}/${_base}"
license=('custom')
arch=('x86_64')
depends=(gdal python-affine python-attrs python-certifi python-cligj python-snuggs python-click-plugins python-setuptools)
makedepends=(cython)
# checkdepends=(python-pytest python-hypothesis python-boto3 python-shapely)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('4504a58f35c225178d7261dc0a6016c3c23608f19aa29678553227f73adbc6cec03e3986168785c9c49e1222a679802ba1852a1b377b2816248b40933b1d4ffa')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

# check() {
#   cd ${_base}-${pkgver}
#   local _pyversion=$(python -c "import sys; print(sys.version[:3])")
#   mv ${_base} .${_base}
#   PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-${_pyversion}:${PYTHONPATH}" py.test tests -k "not rio_env_no_credentials and not info_azure_unsigned"
# }

package() {
  cd ${_base}-${pkgver}
  # mv .${_base} ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
