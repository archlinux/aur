# Maintainer: Rich Li <rich@dranek.com>
pkgname='python2-xarray'
pkgver=0.7.0
pkgrel=1
pkgdesc="N-D labeled arrays and datasets in Python"
url="https://pypi.python.org/pypi/xarray"
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
#source=(https://pypi.python.org/packages/source/x/xarray/xarray-"$pkgver".tar.gz)
# I'm using the Github source instead of the PyPI source since the Github source includes the data files used for testing
source=(https://github.com/xarray/xarray/archive/v"$pkgver".tar.gz)
md5sums=('895faa8bc439a0bdf3e41e5a74c137b2')
sha1sums=('4dc3bb7f39d99c5fda7065d136438634bc00cfb3')
sha256sums=('18a6ffb10283007fb240456196c144950691d54f5953ba3d7fb5eb4d0c133cfa')
 
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
