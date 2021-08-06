# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
# Contributor: Johannes Loethberg <johannes@kyriasis.com>
pkgname=python-geojson
pkgver=2.5.0
pkgrel=2
pkgdesc="Python bindings and utilities for GeoJSON"
url="https://github.com/frewsxcv/python-geojson"
arch=('any')
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=(python-geojson-$pkgver.tar.gz::https://github.com/frewsxcv/python-geojson/archive/$pkgver.tar.gz
        0001-Remove-encoding-parameter-from-json.load-for-Python-.patch)
sha1sums=('e24040ec8efc582d2d3ef71b4e922ab5fe3b2bdd'
          'fcb3e74597fe4858c95ab63c2d38b04f27e80516')

prepare() {
  cd geojson-$pkgver
  patch -p1 < "${srcdir}"/0001-Remove-encoding-parameter-from-json.load-for-Python-.patch
}

build() {
  cd geojson-$pkgver
  python setup.py build
}

check() {
  cd geojson-$pkgver
  python setup.py test
}

package() {
  cd geojson-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/python-geojson/LICENSE
}

# vim:set sw=2 et:
