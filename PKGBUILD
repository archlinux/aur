# Maintainer: Jianchen YANG <farseerfc@gmail.com>

pkgname=python-justbases
_pkgname=justbases
pkgver=0.15.2
pkgrel=2
pkgdesc="conversion of ints and rationals to any base"
url="https://github.com/mulkieran/justbases"
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-hypothesis')
license=('LGPL-2.1-or-later')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mulkieran/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3d85648d1c797f1857decc641d648b7d3b6902b204e4b7a4961896c5ffe055ef')

check() {
    cd "$srcdir/${_pkgname}-$pkgver"
    PYTHONPATH=src python -m unittest discover -vs .
}
build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
