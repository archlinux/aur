# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=rasterio
pkgname=python-${_base}
pkgver=1.5.2
pkgrel=1
pkgdesc="Fast and direct raster I/O for use with NumPy"
url="https://github.com/${_base}/${_base}"
license=(BSD-3-Clause)
arch=(x86_64)
depends=(gdal python-affine python-attrs python-certifi python-click
  python-cligj python-numpy python-pyparsing)
makedepends=(python-build python-installer python-setuptools cython)
optdepends=('ipython: for ipython support'
  'python-boto3: for s3 support'
  'python-matplotlib: for plotting support'
  'python-swiftclient: for OpenStack support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('1555f76a963a2520c2bcade4844b62e5b9b2b82254bc3024e033a4df9da64295ab5ed8f1821f824d4ea9f593156e7d3c8eab332d5f04150d6956eec27221d482')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
