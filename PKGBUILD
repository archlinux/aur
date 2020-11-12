# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-flask-restful
pkgver=0.3.8
pkgrel=3
pkgdesc="Simple framework for creating REST APIs"
url="https://github.com/flask-restful/flask-restful"
license=('BSD')
arch=('any')
depends=('python-six' 'python-flask' 'python-aniso8601' 'python-pytz')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-mock' 'python-blinker' 'python-pycryptodome')
source=("$pkgname-$pkgver.tar.gz::https://github.com/flask-restful/flask-restful/archive/$pkgver.tar.gz")
sha512sums=('15172114fcedc2f4286cf5f583d95e42c8c8ce6553f9a44e57124f2b1417bf9f094dcb5154a6933ebebc8022f39d4d7969d29d38576111f9d5b45f630b36a66c')

build() {
  cd flask-restful-$pkgver
  python setup.py build
}

check() {
  cd flask-restful-$pkgver
  python setup.py nosetests || echo "Tests failed"
}

package() {
  cd flask-restful-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
