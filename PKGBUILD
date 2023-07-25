# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Maintainer: David Rosenstrauch <darose@darose.net>

pkgbase='python-common-ta-lib'
pkgname=("python-ta-lib")
pkgver=0.4.27
pkgrel=1
pkgdesc="Python wrapper for TA-Lib"
url="https://github.com/TA-Lib/ta-lib-python"
makedepends=('python-setuptools' 'python-numpy' 'cython' 'ta-lib')
license=('BSD')
arch=('any')
source=("https://github.com/TA-Lib/ta-lib-python/archive/refs/tags/TA_Lib-$pkgver.tar.gz")
sha256sums=('6d81479267330475f17c114ed4c92641d8a75ecc3dd11172c42f2a1cd157cd4c')

prepare() {
    sed -r 's/raise.*build_ext overridden.*/return/' -i ta-lib-python-TA_Lib-$pkgver/setup.py
}

build() {
    cd "$srcdir"/ta-lib-python-TA_Lib-$pkgver
    python setup.py build
}

package_python-ta-lib() {
    depends=('python-numpy' 'ta-lib')
    optdepends=('cython')

    cd $srcdir/ta-lib-python-TA_Lib-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
}
