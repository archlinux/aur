# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-geopandas
_pkgname=geopandas
pkgver=0.6.2
pkgrel=1
pkgdesc="Geographic pandas extension"
arch=('any')
url="https://github.com/geopandas/geopandas"
license=('BSD')
checkdepends=('python-descartes' 'python-matplotlib' 'python-pytest' 'python-rtree')
depends=('python' 'python-fiona' 'python-numpy' 'python-pandas' 'python-pyproj' 'python-shapely' 'python-six')
optdepends=('python-descartes' 'python-geopy' 'python-psycopg2')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/geopandas/geopandas/archive/v$pkgver.tar.gz"
    "1227.patch")
sha256sums=('2097f9661b8f04ce49592dcb523a861829c1bd6ad747454355c93cc341cd366b'
            '8236ac8a9f8d8f5b37485d59e81d400d0f7e42f624951fdd6df0599ed5397a47')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    patch -p1 < ../1227.patch
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    pytest
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
