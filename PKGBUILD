# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Poached from Arch Strike:
# Original: ArchStrike <team@archstrike.org>

pkgname=pdfminer3k
pkgver=1.3.1
pkgrel=1
arch=('any')
pkgdesc='A python3 port of pdfminer'
license=('MIT')
url='https://pypi.python.org/pypi/pdfminer3k'
depends=('python')
makedepends=('python-setuptools')
provides=('pdfminer')
source=("https://pypi.python.org/packages/8c/87/cee0aa24f95c287020df7e3936cb51d32b34b05b430759bac15f89ea5ac2/pdfminer3k-$pkgver.tar.gz" "LICENSE")
sha512sums=('7d6e3aa1a3c004d2356c3db7a4a2e75413f9cef3707d7c81c28b668bd882ffaac90543e4496cf4e36e281176248d8510cc759a82548d6237bc33da7b7ab5ba44'
            'f39753423638ab131ac193675e9280163769fe1102315f5c810c5bb58e255fc5673f0c1fbb96f0b153151cb8fc2763d38615a465f4c0e5fc121c0103cf97ab5c')

prepare() {
  grep -iRl 'python' ${pkgname}-${pkgver} | xargs sed -i 's|python2|python|'
}

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  python setup.py install --root="$pkgdir" --optimize=1
  for i in dumppdf latin2ascii pdf2txt; do mv "${pkgdir}/usr/bin/${i}.py" "${pkgdir}/usr/bin/${i}3k.py";done
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
