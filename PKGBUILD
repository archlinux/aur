# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-folium
_pkgname=folium
pkgver=0.11.0
pkgrel=1
pkgdesc="Python Data. Leaflet.js maps"
arch=('any')
url="https://github.com/python-visualization/folium"
license=('MIT')
checkdepends=('python-pillow' 'python-pytest' 'python-selenium')
depends=('python-jinja' 'python-branca')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-visualization/$_pkgname/archive/v$pkgver.tar.gz"
    "https://patch-diff.githubusercontent.com/raw/python-visualization/folium/pull/1324.patch")
sha256sums=('5b32ffb900b6d09a0b3e23d44bfda39c6f84b63a447b0700eb01725cb6a5f0bd'
            '4b168908e9184f8f3b883c5409b887c8448614f640e308d0484d5085266965d4')
prepare() {
    cd "$_pkgname-$pkgver"
    patch -p1 -i ../1324.patch
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    PYTHONPATH=. pytest
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
}
