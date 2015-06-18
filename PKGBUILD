# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=python-trollius
_pyname=trollius
pkgver=1.0.4
pkgrel=1
pkgdesc="Port of the Tulip project (asyncio module, PEP 3156)"
url="https://bitbucket.org/enovance/trollius"
arch=("any")
license=('Apache')
depends=('python')
makedepends=('python-sphinx')
source=(https://pypi.python.org/packages/source/t/${_pyname}/${_pyname}-${pkgver}.tar.gz)
sha512sums=('f8df8c9f0034e6075e2a356a0bcfcd7908d98d8d14b07332a71de0115753e17335f5b8030c06c6b2a5b79437392ccf13f92d46155622f789b13c36d04c6d1f9e')

build() {
  cd ${_pyname}-${pkgver}/doc
  make man text
}

check() {
  cd ${_pyname}-${pkgver}
  python runtests.py
}

package() {
  cd ${_pyname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgbase}/README"
  install -Dm 644 doc/build/text/{asyncio,using}.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 doc/build/man/trollius.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgbase}"
}

# vim: ts=2 sw=2 et:
