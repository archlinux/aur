# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Imported from Arch Strike
# Original: ArchStrike <team@archstrike.org>

buildarch=1

pkgname=python2-cybox
pkgver=2.1.0.17
pkgrel=1
pkgdesc="A Python library for parsing and generating CybOX 2.1.0 content."
url="https://github.com/CybOXProject/python-cybox"
depends=('python2')
makedepends=('python2-setuptools')
license=('custom')
arch=('any')
source=("https://github.com/CybOXProject/python-cybox/archive/v${pkgver}.tar.gz")
sha512sums=('e9b6cee6bcd7703c758a55a76424882b8d7e14fe4cdcfa8bdfe64e3613a9b02a26714f529e8a42d99c665f2aec7b5adedfe81467535a44c6bbbf1995ea9c7a9d')

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
