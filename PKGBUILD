# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=rasterio
pkgname=python-${_base}
pkgver=1.4.1
pkgrel=4
pkgdesc="Fast and direct raster I/O for use with Numpy and SciPy"
url="https://github.com/${_base}/${_base}"
license=(BSD)
arch=(x86_64)
depends=(gdal python-affine python-attrs python-certifi python-cligj
  python-numpy python-click-plugins python-pyparsing)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
optdepends=('ipython: for ipython support'
  'python-boto3: for s3 support'
  'python-matplotlib: for plotting support'
  'python-swiftclient: for OpenStack support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('349511446bd2f9b1dcc641f9039563bbc0e4796816b643f2d88b1d326a6f74ccb552aa7c24710e7cff130456fd9506c9cbe0fb1ab5892a08d1535102b0aadacc')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
