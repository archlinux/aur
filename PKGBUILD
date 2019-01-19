# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
_name=asgi_amqp
pkgbase=python-asgi-amqp
pkgname=('python-asgi-amqp' 'python2-asgi-amqp')
pkgver=1.1.3
pkgrel=1
pkgdesc="AMQP-backed ASGI channel layer implementation"
url="https://github.com/ansible/asgi_amqp"
license=('BSD')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('60d84efb721b234243326eb4874f98fb045d60445a4b14a8645c889a5dfebe86')

prepare() {
  cp -a ${_name}-${pkgver}{,-py2}
}

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build

  cd "$srcdir/${_name}-${pkgver}-py2"
  python2 setup.py build
}

package_python-asgi-amqp() {
  depends=('python-six'
           'python-kombu'
           'python-msgpack'
           'python-asgiref1'
           'python-jsonpickle')
  cd "$srcdir/${_name}-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-asgi-amqp() {
  depends=('python2-six'
           'python2-kombu'
           'python2-msgpack'
           'python2-asgiref1'
           'python2-jsonpickle')
  cd "$srcdir/${_name}-${pkgver}-py2/"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sts=2 sw=2 et ft=PKGBUILD
