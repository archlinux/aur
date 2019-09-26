# Maintainer: Rich Li <rich@dranek.com>
pkgname='python-xarray'
_name=${pkgname#python-}
pkgver=0.13.0
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
md5sums=('b6f726988103a0b1931458786b156072')
sha1sums=('99a1feb68499c2954e3e407f6d382a9ca0eec23b')
sha256sums=('80e5746ffdebb96b997dba0430ff02d98028ef3828e6db6106cbbd6d62e32825')

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
