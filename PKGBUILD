# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: pumpkin <pumpkin at mailoo dot org>
# Contributor: Vsevolod Balashov <vsevolod at balashov dot name>
# Maintainer: edacval <edacval@gmail.com>

pkgname=python2-gunicorn
pkgver=19.9.0
pkgrel=3
pkgdesc='WSGI HTTP Server for UNIX'
arch=('any')
url='http://gunicorn.org/'
license=('MIT')
makedepends=('python2-setuptools')
source=("gunicorn-$pkgver.tar.gz::https://github.com/benoitc/gunicorn/archive/$pkgver.tar.gz")
sha512sums=('8d1ff775dd5c1abb8bb4c80aecacb544382e38d101f105fd0fd7eb6bf98ecb663dd533d16e7b1741d6e5ef0eb12a707ab90e0a7751356e625725f076b4dc1a30')

build() {
  cd "$srcdir"/gunicorn-$pkgver
  python2 setup.py build
}

package() {
  depends=('python2-setuptools')
  provides=('gunicorn-python2')
  conflicts=('gunicorn-python2')
  replaces=('gunicorn-python2')
  optdepends=('python2-eventlet: For asynchronous request handling with eventlet.'
              'python2-gevent: For asynchronous request handling with gevent.')

  cd "$srcdir"/gunicorn-$pkgver
  python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
  rm -r "$pkgdir"/usr/bin/gunicorn_paster
  mv "$pkgdir"/usr/bin/gunicorn "$pkgdir"/usr/bin/gunicorn-python2
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

