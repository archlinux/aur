# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=rasterio
pkgname=python-${_base}
pkgver=1.3.0
pkgrel=1
pkgdesc="Rasterio reads and writes geospatial raster datasets"
url="https://github.com/${_base}/${_base}"
license=('custom')
arch=('x86_64')
depends=(gdal python-affine python-attrs python-certifi python-cligj python-snuggs python-click-plugins python-setuptools)
makedepends=(cython)
checkdepends=(python-pytest python-hypothesis python-boto3 python-shapely)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('0a8fb411cb5c9454fa27efcd36f980439ae73797a1a7988460ea9b99ee4adbc81427f33c089fbfb2104c14ec66acd4ce0639169541bdbdbad6499c8ce09117ce')

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
