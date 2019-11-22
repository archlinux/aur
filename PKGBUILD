# Maintainer: Rich Li <rich@dranek.com>
pkgname='python-xarray'
_name=${pkgname#python-}
pkgver=0.14.1
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
md5sums=('b2cbc20f4d91312d2444e6a600f982f5')
sha1sums=('6c760b4af85e6459296e1c30b590c6f3ef6abd59')
sha256sums=('04b2f4d24707b8871a7ffa37328d0a2de74e81bd30791c9608712612601abd23')

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
