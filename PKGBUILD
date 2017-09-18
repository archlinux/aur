# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=python-trollius
_pyname=trollius
pkgver=2.1
pkgrel=1
pkgdesc='Port of the Tulip project (asyncio module, PEP 3156)'
url='https://github.com/haypo/trollius'
arch=("any")
license=('Apache')
depends=('python')
makedepends=('python-sphinx')
checkdepends=('python-pytest')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/haypo/trollius/archive/trollius-${pkgver}.tar.gz)
sha256sums=('c9f7f35b011afa6adbd92d91ca347e76412ac3ff56a53133d36800892e5e6383')
sha512sums=('30e9234fcd702dfb2a843efeab00a499f83e5e3621d19b0468fa77827697d730d69a24917db259349b6d59340a07e035098a8e57f3719993ae6374127ae06b1c')

build() {
  cd ${_pyname}-${_pyname}-${pkgver}/doc
  make man text
}

check() {
  cd ${_pyname}-${_pyname}-${pkgver}
  PYTHONPATH=. py.test -k 'not test_step_future'
}

package() {
  cd ${_pyname}-${_pyname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm 644 doc/build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 doc/build/man/trollius.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgbase}"
}

# vim: ts=2 sw=2 et:
