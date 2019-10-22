# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Nishit Joseph (reachjlight at gmail dot com)
# Contributor: Martin Corley <Martin.Corley@ed.ac.uk>

pkgname=python2-openpyxl
pkgver=2.6.2
_pkgtag='3640394bff97'
pkgrel=2
pkgdesc="A Python library to read/write Excel 2007 xlsx/xlsm files"
arch=('any')
url="https://openpyxl.readthedocs.org/"
license=('MIT')
makedepends=('python2-setuptools' 'python2-jdcal' 'python2-et-xmlfile')
source=("$pkgname-$pkgver.tar.bz2::https://bitbucket.org/openpyxl/openpyxl/get/${pkgver}.tar.bz2"
        "LICENCE")
sha256sums=('7935ee3b99f9e6c5c105e38cae710f5872241d3c0c63a937f7097b4a2c05e83a'
            '0c84bb42f5d367e5ebf9fc2dde35b16141df5ee0fdc189250858bc6c5560f69e')

prepare() {
  cd openpyxl-openpyxl-${_pkgtag}

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  cd openpyxl-openpyxl-${_pkgtag}
  python2 setup.py build
}

package() {
  depends=('python2-jdcal' 'python2-et-xmlfile')
  optdepends=('python2-pillow: needed to include images'
          'python2-lxml: alternative XML backend'
           'python2-defusedxml: guard against various XML vulnerabilities')
  cd openpyxl-openpyxl-${_pkgtag}
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 "$srcdir"/LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
}

