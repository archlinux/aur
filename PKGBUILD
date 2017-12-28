# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Imported from Arch Strike
# Original: ArchStrike <team@archstrike.org>

buildarch=1

pkgname=python2-cybox
pkgver=2.1.0.14
pkgrel=1
pkgdesc="A Python library for parsing and generating CybOX 2.1.0 content."
url="https://github.com/CybOXProject/python-cybox"
depends=('python2')
makedepends=('python2-setuptools')
license=('custom')
arch=('any')
source=("https://github.com/CybOXProject/python-cybox/archive/v${pkgver}.tar.gz")
sha512sums=('80bdbf1db78f62017708aac8b0df7ca2833a167991cff8c73117533f3fd1519b60d122c93730abc3e80386bbd72e52aa469335759dc928d922313b6bb69fe40a')

build() {
  cd python-cybox-"${pkgver}"
  python2 setup.py build
}

package() {
  cd python-cybox-"${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.txt
  find "${pkgdir}" -type f -name '*.py' | xargs sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|'
}
