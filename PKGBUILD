# Maintainer: Yardena Cohen <yardenack at gmail com>
# Based on a PKGBUILD by: Rich Li <rich at dranek com>

pkgname=python-pyshp
_pkgname=pyshp
pkgver=3.0.1
pkgrel=1
pkgdesc="Python read/write support for ESRI Shapefile format"
arch=('any')
url="https://github.com/GeospatialPython/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=(
    'python-build'
    'python-hatchling'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('c9ae842e04531234300b7cc0c245e5b9cfd26cfbfd3360b1fb9c4b525bec62e5dd615600a8975c9f70388d1a47c408c3a47546579f57eae3bd57e709369b90b3')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
