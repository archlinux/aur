# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-pyparallel
pkgver=0.2.2
pkgrel=1
pkgdesc="Multiplatform Parallel Port Module for Python"
arch=('any')
url="http://pyserial.sf.net"
license=('custom:PYTHON')
depends=('python2')
_pypi_key="87/85/be9988fdafabb41d6cc0a1a5dc70a351d968e0b3e80d8b627dc7ad075712"
source=("https://pypi.python.org/packages/${_pypi_key}/pyparallel-${pkgver}.tar.gz" "LICENSE.txt")
md5sums=('c561af9e15271a1c4690a764d3028999'
         '83ff407fcc75ce495f09ff03637bb814')

build() {
  cd "$srcdir"/pyparallel-$pkgver

  sed -i -e "s|/usr/bin/env python|#!/usr/bin/env python2|" \
            $(find -name '*.py')

  python2 setup.py build
}

package() {
  cd "$srcdir"/pyparallel-$pkgver

  python2 setup.py install --root="$pkgdir" --optimize=1

  install -D -m644 "$srcdir"/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

