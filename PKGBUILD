# Maintainer: Rich Li <rich@dranek.com>
pkgname='python2-xarray'
pkgver=0.9.1
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
md5sums=('db441216fe25492b99462f39d47f363f')
sha1sums=('a7049a4d650cb855b467bf462955e60afb98c612')
sha256sums=('43a17d234e13f96524c08a0fc19c578a136bf01cf27e759e6c9adbfdeeb68283')

build() {
  cd "$srcdir/xarray-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/xarray-$pkgver"
  pytest2 xarray
}
 
package() {
  cd "$srcdir/xarray-$pkgver"
  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
