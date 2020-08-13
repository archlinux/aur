# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-geopandas
_pkgname=geopandas
pkgver=0.8.1
pkgrel=1
pkgdesc="Geographic pandas extension"
arch=('any')
url="https://github.com/geopandas/geopandas"
license=('BSD')
checkdepends=('python-descartes' 'python-matplotlib' 'python-pytest' 'python-rtree')
depends=('python' 'python-fiona' 'python-numpy' 'python-pandas' 'python-pyproj' 'python-shapely')
optdepends=('python-pyarrow' 'python-descartes' 'python-geopy' 'python-psycopg2')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/geopandas/geopandas/archive/v$pkgver.tar.gz"
    "1544.patch")
sha256sums=('c73b7c5a428ffa2c9b1fe8c0ff267d67df9a87143a0d3a95323401823218a7b1'
            'cb7ce76526a311fbe5e47df8b79d90b8dec0eeeb2a736b6f3482acee68ffa4f1')

prepare() {
    cd "$_pkgname-$pkgver"
    patch -p1 < ../1544.patch
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    pytest
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
