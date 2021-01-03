# Maintainer: Thomas Heinemann <thomas@niphba.de>

pkgname=mailparser
pkgver=3.14.0
pkgrel=1
pkgdesc='Tokenizer for raw mails'
arch=(any)
url=https://github.com/SpamScope/mail-parser
license=(Apache)
depends=(python-ipaddress
         python-simplejson
         python-six)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('6d92143d826380d26a167f208838f8c69dce3dbfd4b1049e6f9b100f1dd5d893024169bb84297a1eb26107651698d30ed6d8ca087ae40d682460773e66715e38')

build() {
  cd mail-parser-$pkgver
  python setup.py build
}

# Tests need 'msgconvert' utility
#check() {
#  cd mail-parser-$pkgver
#  make test || warning "Tests failed"
#}

package() {
  cd mail-parser-$pkgver
  python setup.py install --root="$pkgdir" -O1
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
