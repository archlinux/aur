# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>

pkgbase='python-common-ta-lib'
pkgname=("python-ta-lib" "python2-ta-lib")
pkgver=0.4.19
pkgrel=1
pkgdesc="Python wrapper for TA-Lib"
url="https://github.com/mrjbq7/ta-lib"
makedepends=('python-setuptools' 'python-numpy' 'cython' 'ta-lib'
             'python2-setuptools' 'python2-numpy' 'cython2')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/T/TA-Lib/TA-Lib-$pkgver.tar.gz")
sha256sums=('5303227898f8f08baecb4d3b8767c85891b65b21f481a3ecbaa6e901c3531db5')

prepare() {
    sed -r 's/raise.*build_ext overridden.*/return/' -i TA-Lib-$pkgver/setup.py

    cp -r TA-Lib-$pkgver{,-py2}
}

build() {
    cd "$srcdir"/TA-Lib-$pkgver
    python setup.py build

    cd "$srcdir"/TA-Lib-$pkgver-py2
    python2 setup.py build
}

package_python-ta-lib() {
    depends=('python-numpy' 'ta-lib')
    optdepends=('cython')

    cd $srcdir/TA-Lib-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
}

package_python2-ta-lib() {
    depends=('python2' 'python2-numpy' 'ta-lib')
    optdepends=('cython2')

    cd "$srcdir"/TA-Lib-$pkgver-py2
    python2 setup.py install -O1 --skip-build --root="$pkgdir"
}
