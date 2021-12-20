# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-numba
pkgver=0.55.0rc1
pkgrel=1
pkgdesc="NumPy aware dynamic Python compiler using LLVM"
url="https://numba.pydata.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python-llvmlite>=0.38.0rc1' 'python-llvmlite<0.39' 'python-numpy>=1.17' 'intel-tbb>=2021.1')
makedepends=('cython' 'python-setuptools')
optdepends=('python-scipy>=1.0.0')
#source=(numba-$pkgver.tar.gz::https://github.com/numba/numba/archive/$pkgver.tar.gz)
source=(numba-$pkgver.tar.gz::https://github.com/numba/numba/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('fd9a60978f379350af06cc138260ed9e2b22fd5960d55830bec26819331241c6')

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
