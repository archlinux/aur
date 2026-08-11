# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=rasterio
pkgname=python-${_base}
pkgver=1.5.1
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
sha512sums=('b5dee2765da54ea557dd5971a89c4a500a809a935b6d243268a98824efe1f8073b62bf8faa843673fa871baf7d6c5d5efe8c40c686f36da04ac8bdee1121dbd5')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
