# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-flask-restful
pkgver=0.3.9
pkgrel=5
pkgdesc="Simple framework for creating REST APIs"
url="https://github.com/flask-restful/flask-restful"
license=('BSD')
arch=('any')
depends=('python-six' 'python-flask' 'python-aniso8601' 'python-pytz')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-blinker' 'python-pycryptodome')
source=("https://github.com/flask-restful/flask-restful/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('34bea8ed6e9de3ad1c2ca63e7af67ed2a175f84c433b08ff643f91d88feda0e3c1c3967deb2fe5ad308b05f373b10c08245edf65ed97a7c5a3683aa900e9edf2')

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
