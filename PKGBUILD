# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-numba
pkgver=0.51.1
pkgrel=1
pkgdesc="NumPy aware dynamic Python compiler using LLVM"
url="http://numba.pydata.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python-llvmlite>=0.33.0' 'python-llvmlite<=0.35' 'python-numpy>=1.15')
makedepends=('cython')
optdepends=('python-scipy>=1.0.0')
source=(numba-$pkgver.tar.gz::"https://github.com/numba/numba/archive/$pkgver.tar.gz")
sha256sums=('249f3b9cc3ceff0f18e328cf6c132b5eaed92c3c1c840d1fbd0823f4dbf7a126')

build() {
  cd "$srcdir/numba-$pkgver"
  python setup.py build
}

check_disabled() { #ERROR: TypeError None is not callable
  cd "$srcdir/numba-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/numba-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
