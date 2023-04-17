# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Maintainer: David Rosenstrauch <darose@darose.net>

pkgbase='python-common-ta-lib'
pkgname=("python-ta-lib")
pkgver=0.4.26
pkgrel=1
pkgdesc="Python wrapper for TA-Lib"
url="https://github.com/TA-Lib/ta-lib-python"
makedepends=('python-setuptools' 'python-numpy' 'cython' 'ta-lib')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/T/TA-Lib/TA-Lib-$pkgver.tar.gz")
sha256sums=('9a1e87ead8990f5c344184e17f268b4f6f50532ea9d40fb7fd161ce5197716da')

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
