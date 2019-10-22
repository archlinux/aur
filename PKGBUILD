# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-et-xmlfile
pkgver=1.0.1
pkgrel=4
pkgdesc="A low memory library for creating large XML files."
arch=('any')
url="https://et-xmlfile.readthedocs.io/"
license=('MIT')
makedepends=('python2-setuptools' 'python2-lxml')
source=("https://pypi.python.org/packages/source/e/et_xmlfile/et_xmlfile-${pkgver}.tar.gz"
        "LICENCE")
sha1sums=('a3e502098bcb7fff22857882d80813c1b6db7608'
          '8b67150a9c68fa385ebe71453141020860a72ff4')

prepare() {
  cd "$srcdir"/et_xmlfile-${pkgver}

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  cd "$srcdir"/et_xmlfile-${pkgver}
  python2 setup.py build
}

package() {
  depends=('python2' 'python2-lxml')

  cd "$srcdir"/et_xmlfile-${pkgver}

  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 "$srcdir"/LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
}
