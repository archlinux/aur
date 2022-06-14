# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=Py6S
pkgname=('python2-py6s')
pkgver=1.7.2
pkgrel=1
pkgdesc="Python 2.7 interface to the 6S Radiative Transfer Model"
arch=('any')
_pypi='https://pypi.python.org'
url='http://py6s.rtwilson.com'
license=('LGPL')
makedepends=('python2-setuptools')
depends=('6sv11' 'python2-scipy' 'python2-matplotlib' 'python2-pysolar')
optdepends=('python2-pandas: AERONET data file support')
options=(!emptydirs)
source=("$_pypi/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5c0d0b47607c4ecdf22a81242af8369fc3b99249da0e23e25e9e7ac554d9adcc')

prepare() {
  # Updates the shebang in Python scripts for Python 2
  find "$srcdir/$_name-$pkgver" \
       -name "*.py" \
       -exec sed -i '1s/python\s*$/python2/' '{}' \;
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
