# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-pyparallel
pkgver=0.2
pkgrel=1
pkgdesc="Multiplatform Parallel Port Module for Python"
arch=('any')
url="http://pyserial.sf.net"
license=('custom:PYTHON')
depends=('python2')
source=(http://downloads.sourceforge.net/project/pyserial/pyparallel/$pkgver/pyparallel-$pkgver.zip
        setup.patch)
md5sums=('46b65592f0b2fa7094ca87bf053e93a7'
         '58454a0ee2f68cd9d3392f864325f854')

build() {
  cd "$srcdir"/pyparallel-$pkgver
  patch -p0 < ../setup.patch
  python2 setup.py build
}

package() {
  cd "$srcdir"/pyparallel-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  sed -i -e "s|/usr/bin/env python|#!/usr/bin/env python2|" \
            $(find "${pkgdir}" -name '*.py')
}

