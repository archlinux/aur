# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-flask-restful
pkgname=(python-flask-restful python2-flask-restful)
pkgver=0.3.7
pkgrel=1
pkgdesc="Simple framework for creating REST APIs"
url="https://github.com/flask-restful/flask-restful"
license=('BSD')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools' 'python-six' 'python2-six' 'python-flask'
             'python2-flask' 'python-aniso8601' 'python2-aniso8601' 'python-pytz' 'python2-pytz')
checkdepends=('python-nose' 'python2-nose' 'python-mock' 'python2-mock' 'python-blinker'
              'python2-blinker' 'python-crypto' 'python2-crypto')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/flask-restful/flask-restful/archive/$pkgver.tar.gz")
sha512sums=('1d1d066dec5f39af3197b680f791d83df686602b703efe874ea0e81d7f3b65f605dbdb63f84fdd07e469c6824d52571e195ae70f58e1543b53f13a81e1cd8543')

prepare() {
  cp -a flask-restful-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/flask-restful-$pkgver
  python setup.py build

  cd "$srcdir"/flask-restful-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/flask-restful-$pkgver
  python setup.py nosetests || warning "Tests failed"

  cd "$srcdir"/flask-restful-$pkgver-py2
  python2 setup.py nosetests || warning "Tests failed"
}

package_python-flask-restful() {
  depends=('python-six' 'python-flask' 'python-aniso8601' 'python-pytz')

  cd flask-restful-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-flask-restful() {
  depends=('python2-six' 'python2-flask' 'python2-aniso8601' 'python2-pytz')

  cd flask-restful-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
