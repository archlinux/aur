# Maintainer: jerry73204 <jerry73204 at google gmail>

pkgname=('python-asn1' 'python2-asn1')
pkgver=2.1.0
pkgrel=1
pkgdesc='Python-ASN1 is a simple ASN.1 encoder and decoder for Python 2.6+ and 3.3+.'
arch=('any')
url='https://github.com/andrivet/python-asn1'
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/andrivet/python-asn1/archive/v${pkgver}.tar.gz")
sha256sums=('b3bee56f640b280191283448003a3a4e357a85220401614a1fdbc264c90e66eb')

prepare() {
  cp -a "${srcdir}/python-asn1-${pkgver}"{,-py2}
}

build() {
  cd "${srcdir}/python-asn1-${pkgver}"
  python setup.py build

  cd "${srcdir}/python-asn1-${pkgver}-py2"
  python setup.py build
}

package_python-asn1() {
  depends=('python')
  cd "${srcdir}/python-asn1-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}

package_python2-asn1() {
  depends=('python2')
  cd "${srcdir}/python-asn1-$pkgver-py2"
  python2 setup.py install --skip-build --prefix=/usr --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}
