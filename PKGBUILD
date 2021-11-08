# Maintainer: Trougnouf (Benoit Brummer) <trougnouf@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Tarmo Heiskanen <turskii@gmail.com>

pkgname=python2-flask
pkgver=1.1.4
pkgrel=1
pkgdesc='Micro webdevelopment framework for Python2'
url='http://flask.pocoo.org/'
arch=('any')
license=('custom:BSD')
depends=('python2-werkzeug' 'python2-jinja' 'python2-itsdangerous' 'python2-click')
makedepends=('python2-setuptools'  'python2-werkzeug' 'python2-jinja' 'python2-itsdangerous' 'python-click')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pallets/flask/archive/${pkgver}.tar.gz")
sha512sums=('e7ca33d599c0f7b83542620e827c999124ffe30e31006815b49993a81f9cf0d61dd0433b73f57f922da5aeb76101beccfe63d9a7236e1850e326f838dc1f453f')

build() {
  cd "flask-$pkgver"
  python2 setup.py build
}

check() {
  cd "flask-$pkgver"
  python2 setup.py test
}

package() {
  cd "flask-$pkgver"

  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  mv "$pkgdir"/usr/bin/flask "$pkgdir"/usr/bin/flask2
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}

# vim:set ts=2 sw=2 et:
