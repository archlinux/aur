# Maintainer: Rich Li <rich@dranek.com>
pkgname='python2-xarray'
pkgver=0.10.3
pkgrel=1
pkgdesc="N-D labeled arrays and datasets in Python"
url="http://xarray.pydata.org"
arch=('any')
license=('Apache')
makedepends=('python2-setuptools')
depends=('python2-numpy' 'python2-pandas')
optdepends=('python2-netcdf4: NetCDF4 support'
            'python2-bottleneck: Faster NaN operations'
            'python2-pynio: GRIB and other file format support'
            'python2-cyordereddict: Speed up most internal operations'
            'python2-scipy: OPeNDAP support' 
            'python2-matplotlib: Plotting support')
            # 'python2-dask: Enable out-of-core parallel computation') # (doesn't exist in AUR)
checkdepends=('python2-pytest')
replaces=('python2-xray')
#source=(https://pypi.python.org/packages/source/x/xarray/xarray-"$pkgver".tar.gz)
# I'm using the Github source instead of the PyPI source since the Github source includes the data files used for testing
source=("$pkgname-$pkgver.tar.gz::https://github.com/pydata/xarray/archive/v$pkgver.tar.gz")
md5sums=('ec2a5747c1b00a79bfab76f0fdc001c1')
sha1sums=('3454805742260c8b1b0fa6650bfa93b2df6f2463')
sha256sums=('6179333f24f3ddd51474c673ece972a831a11b4500be02a7b9a4a7e1b17c0a17')

build() {
  cd "$srcdir/xarray-$pkgver"
  python2 setup.py build
}

# NB: the default test suite seems to require dask being installed
# check() {
#   cd "$srcdir/xarray-$pkgver"
#   pytest2 xarray
# }
 
package() {
  cd "$srcdir/xarray-$pkgver"
  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
