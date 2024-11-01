# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=rasterio
pkgname=python-${_base}
pkgver=1.4.2
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
sha512sums=('4f77619e588ea6df1d34a6e07763d7dd8ebfe38f112672571fee6c69a7337f5dc7526f99c268de567b4a8fb9c56ee2df2ceb6d3843d51dcee18d1b96c2e6487c')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
