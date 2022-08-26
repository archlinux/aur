# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Maintainer: David Rosenstrauch <darose@darose.net>

pkgbase='python-common-ta-lib'
pkgname=("python-ta-lib")
pkgver=0.4.24
pkgrel=1
pkgdesc="Python wrapper for TA-Lib"
url="https://github.com/mrjbq7/ta-lib"
makedepends=('python-setuptools' 'python-numpy' 'cython' 'ta-lib')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/T/TA-Lib/TA-Lib-$pkgver.tar.gz")
sha256sums=('9df262312daa0f1a63f281c6a943fe98c8007a2147776c1b43712e04ccede209')

prepare() {
    sed -r 's/raise.*build_ext overridden.*/return/' -i TA-Lib-$pkgver/setup.py
}

build() {
    cd "$srcdir"/TA-Lib-$pkgver
    python setup.py build
}

package_python-ta-lib() {
    depends=('python-numpy' 'ta-lib')
    optdepends=('cython')

    cd $srcdir/TA-Lib-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
}
