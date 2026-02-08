# Maintainer: Yardena Cohen <yardenack at gmail com>
# Based on a PKGBUILD by: Rich Li <rich at dranek com>

pkgname=python-pyshp
_pkgname=pyshp
pkgver=3.0.3
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
sha512sums=('82c3af78b156e080fa9c4c6b2a26c2ad434d6e3c982a42b3327c3d3ae132408bac9965d7859b7a812361e26ebdd6a9c54d4a6db281f1678d48f3bb09211cecde')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
