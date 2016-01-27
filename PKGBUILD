# Maintainer: Rich Li <rich@dranek.com>
pkgname='python-xarray'
pkgver=0.7.0
pkgrel=2
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
            'python-dask: Enable out-of-core parallel computation')
checkdepends=('python-nose')
replaces=('python-xray')
#source=(https://pypi.python.org/packages/source/x/xarray/xarray-"$pkgver".tar.gz)
# I'm using the Github source instead of the PyPI source since the Github source includes the data files used for testing
source=(https://github.com/pydata/xarray/archive/v"$pkgver".tar.gz)
md5sums=('895faa8bc439a0bdf3e41e5a74c137b2')
sha1sums=('4dc3bb7f39d99c5fda7065d136438634bc00cfb3')
sha256sums=('18a6ffb10283007fb240456196c144950691d54f5953ba3d7fb5eb4d0c133cfa')
 
build() {
  cd "$srcdir/xarray-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/xarray-$pkgver"
  nosetests
}
 
package() {
  cd "$srcdir/xarray-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
