# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-flask-jwt
pkgver=0.3.2
pkgrel=7
pkgdesc="JWT token authentication for Flask apps"
url="https://github.com/mattupstate/flask-jwt"
license=('MIT')
arch=('any')
depends=('python-flask' 'python-pyjwt')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mattupstate/flask-jwt/archive/$pkgver.tar.gz")
sha512sums=('7c115ff4964da9a36303ac502dea98cd847abc3c1d45cd0be09b82ec761ee054d7ef97e25fd669112ab29dbfca00b4563914155ab1c8da4fc3d32f0063128b26')

prepare() {
  # Too old options
  sed -i 's/,<1.5.0//' flask-jwt-$pkgver/requirements.txt
  echo > flask-jwt-$pkgver/requirements-dev.txt
  rm flask-jwt-$pkgver/setup.cfg
}

build() {
  cd flask-jwt-$pkgver
  python setup.py build
}

check() {
  cd flask-jwt-$pkgver
  python setup.py pytest
}

package() {
  cd flask-jwt-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
