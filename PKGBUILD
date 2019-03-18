# Maintainer: Rich Li <rich@dranek.com>
pkgname='python-xarray'
_name=${pkgname#python-}
pkgver=0.12.0
pkgrel=1
pkgdesc="N-D labeled arrays and datasets in Python"
url="http://xarray.pydata.org"
arch=('any')
license=('Apache')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-pandas')
optdepends=('python-netcdf4: NetCDF4 support'
            'python-bottleneck: Faster NaN operations'
            # 'python-pynio: GRIB and other file format support'   # (no Python 3 support yet)
            'python-scipy: OPeNDAP support' 
            'python-matplotlib: Plotting support'
            'python-dask: Enable out-of-core parallel computation')
checkdepends=('python-pytest')
replaces=('python-xray')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('55bc20b431220203a3502607d13f4e0c')
sha1sums=('f3e06a2f52d86847a3596468a76e5a2d4c04e691')
sha256sums=('856fd062c55208a248ac3784cac8d3524b355585387043efc92a4188eede57f3')

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
