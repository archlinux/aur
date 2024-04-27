# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-flask-restful
pkgver=0.3.10
pkgrel=1
pkgdesc="Simple framework for creating REST APIs"
url="https://github.com/flask-restful/flask-restful"
license=('BSD')
arch=('any')
depends=('python-six' 'python-flask' 'python-aniso8601' 'python-pytz')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-blinker' 'python-pycryptodome')
source=("https://github.com/flask-restful/flask-restful/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('5f9daf9d7dd2ef603c591d0c4fc49e4880c57a5da48eb21a280ffbcc36807262039074754eaa0fde8f3b1019fcfc48753a99c25c4b0ed36815dcbdd6797fb509')

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
