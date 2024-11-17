# Maintainer: Jianchen YANG <farseerfc@gmail.com>

pkgname=python-justbytes
_pkgname=justbytes
pkgver=0.15.2
pkgrel=3
pkgdesc="computing with and displaying bytes"
url="https://pypi.org/project/justbytes/"
depends=('python' 'python-justbases')
checkdepends=('python-hypothesis')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
license=('LGPL-2.1-or-later')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mulkieran/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('125af80a9b36d834080ec8356ed43a38061cf4208b2d781aa24ee8b0ca9782d1')

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
