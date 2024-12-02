# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=rasterio
pkgname=python-${_base}
pkgver=1.4.3
pkgrel=1
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
sha512sums=('ac4e6b0fa95b5903ed32984712ec81f08aeed54556200b0216e505ca2ad439ab631bdb05d7755924d4d61d4b6bc11e06f7b87185b529c74d672848ca8de911b4')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
