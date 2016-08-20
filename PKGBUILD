# Maintainer: Rich Li <rich@dranek.com>
pkgname='python2-xarray'
pkgver=0.8.2
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
checkdepends=('python2-pytest')
replaces=('python2-xray')
#source=(https://pypi.python.org/packages/source/x/xarray/xarray-"$pkgver".tar.gz)
# I'm using the Github source instead of the PyPI source since the Github source includes the data files used for testing
source=("$pkgname-$pkgver.tar.gz::https://github.com/pydata/xarray/archive/v$pkgver.tar.gz")
md5sums=('6862b32f9e43bb870dbf460198e00358')
sha1sums=('31c4cd31196efdc2200f09ac54e824fb30a06eeb')
sha256sums=('d8766ea5a7d2349142b08a384552fd2b470126a2de70aa31a183e98b52c354f4')

build() {
  cd "$srcdir/xarray-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/xarray-$pkgver"
  py.test2 xarray
}
 
package() {
  cd "$srcdir/xarray-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
