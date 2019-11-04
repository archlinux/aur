# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-braintree
pkgver=3.57.1
pkgrel=1
pkgdesc="Braintree Python Library"
arch=('any')
url="https://www.braintreepayments.com/docs/python"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::https://github.com/braintree/braintree_python/archive/$pkgver.tar.gz")
sha512sums=('12ab4854360510e74649d2c4a18a0e85a811af6e8702230ef73cc68912f610441382de3037ef2ca9c43f0fdb41ac84b6ffa6f6184e6d2d619a4f32aa92ca18eb')

prepare() {
  sed -i -e 's/import cgi/import urllib.parse/' -e 's/cgi.parse_qs/urllib.parse.parse_qs/' braintree_python-$pkgver/braintree/transparent_redirect_gateway.py
}

build() {
  cd braintree_python-$pkgver
  python setup.py build
}

check() {
  cd braintree_python-$pkgver
  nosetests3 tests/unit
}

package() {
  cd braintree_python-$pkgver
  python setup.py install -O1 --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
