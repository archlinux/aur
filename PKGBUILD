# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-socketio4
_pkgname=${pkgname%4}
pkgver=4.6.1
pkgrel=2
pkgdesc="Python implementation of the Socket.IO realtime server (Ver 4)"
arch=('any')
url="https://github.com/miguelgrinberg/python-socketio"
license=('MIT')
depends=('python-six'
         'python-engineio3')
makedepends=('python-setuptools'
             'python-sphinx'
             'python-tornado')
optdepends=('python-tornado: tornado asyncio webserver')
checkdepends=('python-pytest'
              'python-mock')
conflicts=("$_pkgname")
source=("https://github.com/miguelgrinberg/python-socketio/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('aa186b447429248369aebe6e1811e811c3da8ba3bb78efb16cd88904fdff7b05')

build() {
  cd ${_pkgname}-${pkgver}

  python setup.py build
  make -C docs man text SPHINXBUILD=sphinx-build
}

check() {
  cd ${_pkgname}-${pkgver}

  py.test -k 'not test_logger'
}

package() {
  cd ${_pkgname}-${pkgver}

  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/text/index.txt "${pkgdir}/usr/share/doc/${pkgname}/DOCUMENTATION"
  install -Dm 644 docs/_build/man/python-socketio.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
# vim: ts=2 sw=2 et:
