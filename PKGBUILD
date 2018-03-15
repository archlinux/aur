# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=python-trollius
_pyname=trollius
pkgver=2.2
pkgrel=1
pkgdesc='Port of the Tulip project (asyncio module, PEP 3156)'
url='https://github.com/haypo/trollius'
arch=("any")
license=('Apache')
depends=('python')
makedepends=('python-sphinx')
checkdepends=('python-pytest')
options=('!makeflags')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/haypo/trollius/archive/trollius-${pkgver}.tar.gz)
sha256sums=('51606712247fb10e5f2bc9a750c7b72a2fce1300d518b08e26fe1262d0e2d26f')
sha512sums=('ab59d8a10f70691f2c63aba5be99df605701fff71f16f6d8e3ddd85ab9e2e255ff8adbe32a5d8ac3645ee8c115eb80201651b92adad99a9439306501e00d0a17')

build() {
  cd ${_pyname}-${_pyname}-${pkgver}
  python setup.py build
  make -C doc man text
}

check() {
  cd ${_pyname}-${_pyname}-${pkgver}
  PYTHONPATH=. py.test -k 'not test_step_future'
}

package() {
  cd ${_pyname}-${_pyname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm 644 doc/build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 doc/build/man/trollius.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgbase}"
}

# vim: ts=2 sw=2 et:
