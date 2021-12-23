# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Maintainer: David Rosenstrauch <darose@darose.net>

pkgbase='python-common-ta-lib'
pkgname=("python-ta-lib" "python2-ta-lib")
pkgver=0.4.22
pkgrel=1
pkgdesc="Python wrapper for TA-Lib"
url="https://github.com/mrjbq7/ta-lib"
makedepends=('python-setuptools' 'python-numpy' 'cython' 'ta-lib'
             'python2-setuptools' 'python2-numpy' 'cython2')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/T/TA-Lib/TA-Lib-$pkgver.tar.gz")
sha256sums=('9a46706873826435318ad9d5ff62cb0453836f1b133c3265527dcd125d4f00dc')

prepare() {
    sed -r 's/raise.*build_ext overridden.*/return/' -i TA-Lib-$pkgver/setup.py

    cp -r TA-Lib-$pkgver{,-py2}

    sed -r "s/, encoding='utf-8'//" -i TA-Lib-$pkgver-py2/setup.py
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
