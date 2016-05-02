pkgname=('python-xray' 'python2-xray')
pkgver=0.7.2
pkgrel=1
pkgdesc="N-D labeled arrays and datasets in Python"
url="https://pypi.python.org/pypi/xray"
arch=('any')
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://github.com/xray/xray/archive/v"$pkgver".tar.gz)
sha256sums=('9648ea1aed55b604f2fed85228e7cead3c3c7d514aa7a01514cc3de0290f9bfc')
 
build() {
  cp -r "$srcdir/xarray-$pkgver" "$srcdir/xarray2-$pkgver"

  cd "$srcdir/xarray-$pkgver"
  python setup.py build
  
  cd "$srcdir/xarray2-$pkgver"
  python2 setup.py build
}
 
package_python-xray() {
  depends=('python-numpy' 'python-pandas')
  optdepends=('python-netcdf4: NetCDF4 support'
            'python-bottleneck: Faster NaN operations'
            'python-scipy: OPeNDAP support' 
            'python-matplotlib: Plotting support'
            'python-dask: Enable out-of-core parallel computation')
  
  cd "$srcdir/xarray-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

package_python2-xray() {
  depends=('python2-numpy' 'python2-pandas')
  optdepends=('python2-netcdf4: NetCDF4 support'
            'python2-bottleneck: Faster NaN operations'
            'python2-scipy: OPeNDAP support' 
            'python2-matplotlib: Plotting support'
            'python2-dask: Enable out-of-core parallel computation')
  
  cd "$srcdir/xarray2-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
