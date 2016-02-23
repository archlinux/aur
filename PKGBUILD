# Maintainer: Rich Li <rich@dranek.com>
pkgname='python-xarray'
pkgver=0.7.1
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
            'python-dask: Enable out-of-core parallel computation')
checkdepends=('python-nose')
replaces=('python-xray')
#source=(https://pypi.python.org/packages/source/x/xarray/xarray-"$pkgver".tar.gz)
# I'm using the Github source instead of the PyPI source since the Github source includes the data files used for testing
source=(https://github.com/pydata/xarray/archive/v"$pkgver".tar.gz)
md5sums=('486ec0c02138dceaf466fb639eec2759')
sha1sums=('c2fedf4a685d56ba26d4b48f4ee9e30ff5e8aa43')
sha256sums=('6ee215af522e4eabb88eb647098c38f33909afa1ed6faba6dc3d7ce5806b1c02')
 
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
