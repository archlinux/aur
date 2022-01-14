# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-numba
pkgver=0.55.0
pkgrel=1
pkgdesc="NumPy aware dynamic Python compiler using LLVM"
url="https://numba.pydata.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python-llvmlite>=0.38.0' 'python-llvmlite<0.39' 'python-numpy>=1.17' 'intel-tbb>=2021.1')
makedepends=('cython' 'python-setuptools')
optdepends=('python-scipy>=1.0.0')
source=(numba-$pkgver.tar.gz::https://github.com/numba/numba/archive/$pkgver.tar.gz)
sha256sums=('625c8028ba72f8ab94c0febbce94bfb1bf395bf917cf6d4666f24b553de1170e')

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
