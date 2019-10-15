# Maintainer: Rich Li <rich@dranek.com>
pkgname='python-xarray'
_name=${pkgname#python-}
pkgver=0.14.0
pkgrel=1
pkgdesc="N-D labeled arrays and datasets in Python"
url="http://xarray.pydata.org"
arch=('any')
license=('Apache')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-pandas')
optdepends=('python-netcdf4: NetCDF4 support'
            'python-bottleneck: Faster NaN operations'
            'python-scipy: OPeNDAP support' 
            'python-matplotlib: Plotting support'
            'python-rasterio: Read GeoTiffs and other gridded raster datasets'
            'python-dask: Enable out-of-core parallel computation')
checkdepends=('python-pytest')
replaces=('python-xray')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('e34bf5d40c7bd69aa932a773aedec62c')
sha1sums=('401c612c460192ad5e186e4ab9c367760552eacc')
sha256sums=('a8b93e1b0af27fa7de199a2d36933f1f5acc9854783646b0f1b37fed9b4da091')

build() {
  cd "$srcdir/xarray-$pkgver"
  python setup.py build
}

# NB: the default test suite seems to require dask being installed
# check() {
#   cd "$srcdir/xarray-$pkgver"
#   pytest --disable-warnings xarray
# }
 
package() {
  cd "$srcdir/xarray-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
