# Maintainer: Rich Li <rich@dranek.com>
pkgname='python2-xarray'
pkgver=0.7.2
pkgrel=1
pkgdesc="N-D labeled arrays and datasets in Python"
url="http://xarray.pydata.org"
arch=('any')
license=('Apache')
makedepends=('python2-setuptools')
depends=('python2-numpy' 'python2-pandas')
optdepends=('python2-netcdf4: NetCDF4 support'
            'python2-bottleneck: Faster NaN operations'
            'python2-cyordereddict: Speed up most internal operations'
            'python2-scipy: OPeNDAP support' 
            'python2-matplotlib: Plotting support')
            # 'python2-dask: Enable out-of-core parallel computation') # (doesn't exist in AUR)
checkdepends=('python2-nose')
replaces=('python2-xray')
#source=(https://pypi.python.org/packages/source/x/xarray/xarray-"$pkgver".tar.gz)
# I'm using the Github source instead of the PyPI source since the Github source includes the data files used for testing
source=(https://github.com/pydata/xarray/archive/v"$pkgver".tar.gz)
md5sums=('b60d0024194bcb107343286cc973591e')
sha1sums=('742e34510106e2cca36fff6cbb0c6f11b2fbf4c7')
sha256sums=('9648ea1aed55b604f2fed85228e7cead3c3c7d514aa7a01514cc3de0290f9bfc')
 
build() {
  cd "$srcdir/xarray-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/xarray-$pkgver"
  nosetests2
}
 
package() {
  cd "$srcdir/xarray-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
