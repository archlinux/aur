# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-numba
pkgver=0.55.0dev0
pkgrel=1
pkgdesc="NumPy aware dynamic Python compiler using LLVM"
url="https://numba.pydata.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python-llvmlite>=0.37.0' 'python-llvmlite<0.38' 'python-numpy>=1.17')
makedepends=('cython' 'python-setuptools')
optdepends=('python-scipy>=1.0.0')
#source=(numba-$pkgver.tar.gz::"https://github.com/numba/numba/archive/$pkgver.tar.gz")
source=(numba-$pkgver.zip::https://github.com/numba/numba/archive/refs/tags/0.55.0dev0.zip)
sha256sums=('49f00be4e180ff0ea12bd5546a22e0f43eafb871caa20dd7c533c5ecc3a3a81f')

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
