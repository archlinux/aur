# Contributor graziano.giuliani <graziano.giuliani@gmail.com>
# Contributor: Rich Lindsley <rich at dranek dot com>
pkgname=pyresample
pkgrel=1
pkgver=1.22.3
pkgdesc="Geospatial image resampling in Python"
arch=(any)
url="https://github.com/pytroll/${pkgname}"
depends=(python-setuptools python-pyproj python-configobj python-pykdtree python-yaml)
optdepends=('python-numexpr: used to optimize some bottlenecks'
  'python-matplotlib'
  'python-rasterio'
  'python-cartopy'
  'python-dask'
  'python-xarray'
  'python-shapely'
  'python-zarr')
makedepends=(cython)
license=(LGPL3)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('12f3a7039a0dcf611bba546d2e3fd2f44b95620959a3240e36c690cdccc27f35e4d5c10a924568368ef57c90aba765f4446fdb460fa6b168d238c43e8e5001b2')

build() {
  cd ${pkgname}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build_ext --inplace
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
