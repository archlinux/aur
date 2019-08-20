# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=mailparser
pkgver=3.9.3
pkgrel=3
pkgdesc='Tokenizer for raw mails'
arch=(any)
url=https://github.com/SpamScope/mail-parser
license=(Apache)
depends=(python-ipaddress
         python-simplejson
         python-six)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('ca9ecd79fd9b5865714313f9283ec2a4480b261b1810060e4a0ffbe096bd21de5bc29a8446cb1e39e9570e5c1d680870653f72a221bb3bed1da9e4773aa8898c')

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
