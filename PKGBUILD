# Maintainer: kpcyrd <git@rxv.cc>

pkgname=python-sepaxml
pkgver=2.7.0
pkgrel=1
pkgdesc="SEPA Direct Debit XML generation in python"
arch=(any)
url="https://github.com/raphaelm/python-sepaxml"
license=('MIT')
depends=('python' 'python-lxml' 'python-text-unidecode' 'python-xmlschema')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/python-sepaxml/archive/${pkgver}.tar.gz)
sha512sums=('79b16da825e1572424190b48f41e79b77322476edf411821309a5c7fc0084fe7222f559540b4ef1b09d7b0fc95fd84039fd2a18be6da49f823168b2e307e2f55')
b2sums=('54cdc411bce3494bb9b3d035a9a4aa55545443f1647977fbf03c90c5219976f4da1c1c7bbe0d37097905b2c332864d3dd32f34ec557fd743b1d0be63b568c4fe')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  PYTHONPATH=. pytest
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
