# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-numba
pkgver=0.54.0
pkgrel=1
pkgdesc="NumPy aware dynamic Python compiler using LLVM"
url="https://numba.pydata.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python-llvmlite>=0.37.0' 'python-llvmlite<0.38' 'python-numpy>=1.17')
makedepends=('cython' 'python-setuptools')
optdepends=('python-scipy>=1.0.0')
source=(numba-$pkgver.tar.gz::"https://github.com/numba/numba/archive/$pkgver.tar.gz")
sha256sums=('7de8900959076e99646a3b268f57a25dc4c6445b203b34e7276854a3ffeee0c9')

build() {
  cd "$srcdir/numba-$pkgver"
  # tbb 2021.1 required, but arch still has 2020.3
  NUMBA_DISABLE_TBB=1 python setup.py build
}

check_disabled() { #ERROR: TypeError None is not callable
  cd "$srcdir/numba-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/numba-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
