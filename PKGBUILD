# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-engineio3
_pkgname=${pkgname%3}
pkgver=3.14.2
pkgrel=1
pkgdesc="Python implementation of the Engine.IO realtime server (Ver 3)"
arch=('any')
url="https://github.com/miguelgrinberg/python-engineio"
license=('MIT')
depends=('python' 'python-six' 'python-urllib3' 'python-websocket-client' 'python-websockets')
optdepends=('python-eventlet: eventlet driver'
            'python-aiohttp: aiohttp driver'
            'python-tornado: tornado driver'
            'python-gevent: gevent driver'
            'python-gevent-websocket: gevent driver')
makedepends=('python-setuptools' 'python-sphinx' 'python-six' 'python-eventlet' 'python-aiohttp' 'python-tornado'
             'python-urllib3' 'python-websocket-client' 'python-gevent' 'python-gevent-websocket' 'python-websockets')
checkdepends=('python-mock' 'python-pytest' 'python-pytest-runner')
conflicts=("$_pkgname")
options=('!makeflags')
source=(https://github.com/miguelgrinberg/python-engineio/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('6764678026fb45f62fd9cb03eb6ca3840b47905dc9eccf3fdde64596508b82d5')

build() {
  cd ${_pkgname}-${pkgver}

  python setup.py build
  make -C docs man text SPHINXBUILD=sphinx-build
}

check() {
  cd ${_pkgname}-${pkgver}

  python setup.py test
}

package() {
  cd ${_pkgname}-${pkgver}

  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/python-engineio.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
# vim: ts=2 sw=2 et:
