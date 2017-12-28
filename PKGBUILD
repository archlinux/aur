# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# imported from Arch Strike
# Original: ArchStrike <team@archstrike.org>

buildarch=1

pkgname=python2-maec
pkgver=4.1.0.13
pkgrel=1
pkgdesc="An API for parsing and creating MAEC content."
url="https://github.com/MAECProject/python-maec"
depends=('python2' 'python2-cybox' 'python2-lxml')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://github.com/MAECProject/python-maec/archive/v${pkgver}.tar.gz")
sha512sums=('fbfafba65ba5318a4e69e361986c9147efc6aea2e34e62312d022f5c674f366ec417ed4c57b2f4b729b480925d7b46b4be94bbd8c7c10fff6e352b545b043df7')

build() {
  cd python-maec-$pkgver
  python2 setup.py build
}

package() {
  cd python-maec-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  find "${pkgdir}" -type f -name '*.py' | xargs sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|'
  find "${pkgdir}" -type f -name '*.py' | xargs sed -i 's|#!/usr/bin/python|#!/usr/bin/python2|'
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
