# Contributor: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: pumpkincheshire <me at pumpkinCheshire dot com>

pkgname='python-contextily'
_name=contextily
pkgver=1.7.0
pkgrel=1
pkgdesc='Context geo-tiles in Python'
arch=('any')
url='https://github.com/geopandas/contextily'
license=('MIT')
makedepends=(python-build python-installer python-setuptools-scm)
depends=(
  'python'
  'python-geopy'
  'python-matplotlib'
  'python-mercantile'
  'python-numpy'
  'python-pillow'
  'python-rasterio'
  'python-requests'
  'python-joblib'
  'python-xyzservices'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('107ee5107e6d62805b10288f7de85922a4a5372b6c8b1150a7b5e4a97b6a989a65df23230f57b0e1ecc2606d0596dddea52c1433bdc3cefdd523e2dca25f30b0')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
