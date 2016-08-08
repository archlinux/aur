# Maintainer: Rich Li <rich@dranek.com>
pkgname='python2-xarray'
pkgver=0.8.1
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
md5sums=('390d6258b33f887b04fa1578af90a608')
sha1sums=('6ee9f6cecef9ff1e98e3e11d82583d3a028da4d4')
sha256sums=('6ba3884c090f59ea85d0e00dd169fefcfdfc5afc29a3f3225beb97a591e9e304')

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
