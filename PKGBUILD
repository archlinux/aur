# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-flask-restful
pkgver=0.3.7
pkgrel=4
pkgdesc="Simple framework for creating REST APIs"
url="https://github.com/flask-restful/flask-restful"
license=('BSD')
arch=('any')
depends=('python-six' 'python-flask' 'python-aniso8601' 'python-pytz')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-mock' 'python-blinker' 'python-pycryptodome')
source=("$pkgname-$pkgver.tar.gz::https://github.com/flask-restful/flask-restful/archive/$pkgver.tar.gz")
sha512sums=('1d1d066dec5f39af3197b680f791d83df686602b703efe874ea0e81d7f3b65f605dbdb63f84fdd07e469c6824d52571e195ae70f58e1543b53f13a81e1cd8543')

build() {
  cd flask-restful-$pkgver
  python setup.py build
}

check() {
  cd flask-restful-$pkgver
  python setup.py nosetests || warning "Tests failed"
}

package() {
  cd flask-restful-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
