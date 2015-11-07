# Maintainer: Rich Li <rich@dranek.com>
pkgname='python-xray'
pkgver=0.6.1
pkgrel=1
pkgdesc="N-D labeled arrays and datasets in Python"
url="https://pypi.python.org/pypi/xray"
arch=('any')
license=('Apache')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-pandas')
optdepends=('python-netcdf4: NetCDF4 support'
            'python-bottleneck: Faster NaN operations'
            'python-cyordereddict: Speed up most internal operations'
            'python-scipy: OPeNDAP support' 
            'python-matplotlib: Plotting support'
            'python-dask: Enable out-of-core parallel computation')
checkdepends=('python-nose')
#source=(https://pypi.python.org/packages/source/x/xray/xray-"$pkgver".tar.gz)
# I'm using the Github source instead of the PyPI source since the Github source includes the data files used for testing
source=(https://github.com/xray/xray/archive/v"$pkgver".tar.gz)
md5sums=('201ef4249182771a4013e256d330bf96')
sha1sums=('a4ac7c719a76bfa47ab5dec2d63af4468461754b')
sha256sums=('758baad3c29a9e7f505e55314f3a05ba9cce55c2759433dabd81a58c9436abce')
 
build() {
  cd "$srcdir/xray-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/xray-$pkgver"
  nosetests
}
 
package() {
  cd "$srcdir/xray-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
