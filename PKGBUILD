#Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
#Contributor: Gergely Imreh <imrehg(at)gmail(dot)com>

pkgname=python2-pyvisa
_orig_name=PyVISA
pkgver=1.7
pkgrel=1
pkgdesc="A Python package with bindings to the 'Virtual Instrument Software Architecture' library"
depends=('python2')
makedepends=('python2-distribute' 'python2-docutils')
arch=('any')
url="http://pyvisa.sourceforge.net/"
license=('MIT')
source=("https://pypi.python.org/packages/source/P/PyVISA/PyVISA-${pkgver}.tar.gz")
md5sums=('11700c24a49ab1035000d7499b590a24')

prepare() {
  cd "$srcdir"/PyVISA-${pkgver}

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  cd "${srcdir}"/PyVISA-${pkgver}
  python2 setup.py build
}

package() {
  cd "${srcdir}"/PyVISA-${pkgver}

  python2 setup.py install --prefix=/usr --root "${pkgdir}" --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

