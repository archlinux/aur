# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=python2-flask-socketio
_pkgname=Flask-SocketIO
pkgver=0.6.0
pkgrel=2
pkgdesc="Socket.IO integration for Flask applications"
url="https://flask-socketio.readthedocs.org/"
arch=('any')
license=('MIT')
depends=('python2-flask' 'python2-gevent-websocket' 'python2-gevent-socketio')
makedepends=('python2-setuptools' 'python2-sphinx')
options=('!makeflags')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/miguelgrinberg/Flask-SocketIO/archive/v${pkgver}.tar.gz)
sha512sums=('bf2953411baa357e594e5ea4680bf01a5baf12ec0e15cdf5f45a683668524fead5e8625bc4198640e1d75ac1d969a8d0b5f2d57008785486b4b571db89e2fd47')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -ri 's|(sphinx-build)|\12|g' docs/Makefile
}

build() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py build

  cd docs
  make man text
}

check() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py test
}

package () {
  cd ${_pkgname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 docs/_build/text/index.txt "${pkgdir}/usr/share/doc/${pkgname}/DOCUMENTATION"
  install -Dm 644 docs/_build/man/flask-socketio.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:
