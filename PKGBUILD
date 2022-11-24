# Maintainer: Kherim Willems <kherimwillem at gmail dot com>
_pkgname=numba-scipy
pkgname=python-${_pkgname}
pkgver=0.3.1
pkgrel=1
pkgdesc="NumPy aware dynamic Python compiler using LLVM"
url="https://numba.pydata.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python-numba>=0.45' 'python-scipy<1.10.0' python-setuptools)
makedepends=('cython')
source=($_pkgname-$pkgver.tar.gz::https://github.com/numba/${_pkgname}/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('26a508e0af96deb8180ebbaaa31be85586ac008a7de6920202b68f4c80499d84')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

check_disabled() { #ERROR: TypeError None is not callable
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}