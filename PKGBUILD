# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# imported from Arch Strike
# Original: ArchStrike <team@archstrike.org>

buildarch=1

pkgname=python2-maec
pkgver=4.1.0.14
pkgrel=1
pkgdesc="An API for parsing and creating MAEC content."
url="https://github.com/MAECProject/python-maec"
depends=('python2' 'python2-cybox' 'python2-lxml')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://github.com/MAECProject/python-maec/archive/v${pkgver}.tar.gz")
sha512sums=('990b83410707778bcd239c831fcaa87d4efc190881d592f03b5000202a6965689703459ada56da39bc66b72b7075bae183ef5b710707ab113c5a6e6b4d883331')

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
