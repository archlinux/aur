# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Maintainer: David Rosenstrauch <darose@darose.net>

pkgbase='python-common-ta-lib'
pkgname=("python-ta-lib")
_altpkgname='ta_lib'
pkgver=0.8.3
pkgrel=1
pkgdesc="Python wrapper for TA-Lib"
url="https://github.com/TA-Lib/ta-lib-python"
makedepends=('python-setuptools' 'python-numpy>2.0.0' 'python-numpy<3.0.0' 'cython' 'ta-lib>=0.7.1' 'python-build' 'python-installer' 'python-cmake-bin')
license=('BSD')
arch=('any')
source=("https://github.com/TA-Lib/ta-lib-python/releases/download/v$pkgver/$_altpkgname-$pkgver.tar.gz")
sha256sums=('8c848d87f82f1ac6668aba480463484a80f3a365bed5a55243ebab49508dc09f')

build() {
    cd "$srcdir"/$_altpkgname-$pkgver
    python -m build --wheel --no-isolation
}

package_python-ta-lib() {
    depends=('python-numpy' 'ta-lib')
    optdepends=('cython')

    cd $srcdir/$_altpkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
