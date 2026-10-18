# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Maintainer: David Rosenstrauch <darose@darose.net>

pkgbase='python-common-ta-lib'
pkgname=("python-ta-lib")
_altpkgname='ta_lib'
pkgver=0.8.2
pkgrel=1
pkgdesc="Python wrapper for TA-Lib"
url="https://github.com/TA-Lib/ta-lib-python"
makedepends=('python-setuptools' 'python-numpy>2.0.0' 'python-numpy<3.0.0' 'cython' 'ta-lib>=0.7.1' 'python-build' 'python-installer')
license=('BSD')
arch=('any')
source=("https://github.com/TA-Lib/ta-lib-python/releases/download/v$pkgver/$_altpkgname-$pkgver.tar.gz")
sha256sums=('75f4d8d9c9e0273cf6086b3aefa33fd9a9a3e465fc38ab35d41ccd9fe539093e')

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
