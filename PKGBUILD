# Maintainer: Rich Li <rich@dranek.com>
pkgname='python-xarray'
pkgver=0.10.6
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
#source=(https://pypi.python.org/packages/source/x/xarray/xarray-"$pkgver".tar.gz)
# I'm using the Github source instead of the PyPI source since the Github source includes the data files used for testing
source=("$pkgname-$pkgver.tar.gz::https://github.com/pydata/xarray/archive/v$pkgver.tar.gz")
md5sums=('fe997aa7443d0afd8180452b6cf44af0')
sha1sums=('9cceab192ed66f49e44d36ca696b5fb35019fd80')
sha256sums=('55666db7e2c32ff2342038c5b4cc087fb545b2d010df17f0ba6de466fd665494')

build() {
  cd "$srcdir/xarray-$pkgver"
  python setup.py build
}

# NB: the default test suite seems to require dask being installed
# check() {
#   cd "$srcdir/xarray-$pkgver"
#   pytest xarray
# }
 
package() {
  cd "$srcdir/xarray-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
