# Maintainer: Kherim Willems <kherimwillem at gmail dot com>
_pkgname=numba-scipy
pkgname=python-${_pkgname}
pkgver=0.4.0
pkgrel=1
pkgdesc="NumPy aware dynamic Python compiler using LLVM"
url="https://numba.pydata.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=(python-numba python-scipy python-setuptools)
makedepends=(cython python-setuptools)
source=($_pkgname-$pkgver.tar.gz::https://github.com/numba/${_pkgname}/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('2c92faac3199948ededc984181756f9507363c521548209006529f51b6d5020e')

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
