# $Id$
# Maintainer: Shane Stone <shanewstone at gmail>

pkgname=('python2-spiceypy')
pkgver=2.0.0
pkgrel=1
pkgdesc="A Python wrapper for the NAIF C SPICE Toolkit (N66) written using ctypes."
arch=('any')
url="https://github.com/AndrewAnnex/SpiceyPy"
license=('MIT')
makedepends=('python2-six>=1.9.0' 'python2-numpy>=1.8.0' 'python2-setuptools')
source=("https://github.com/andrewannex/spiceypy/archive/v${pkgver}.tar.gz")
md5sums=('7115d8c054e46b21c85863bd42de0a3d')

prepare() {
  mv SpiceyPy-$pkgver SpiceyPy-$pkgver-py2
  cd SpiceyPy-$pkgver-py2

  sed -e "s|#![ ]*/usr/bin/python[0-9]*$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python[0-9]*$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python[0-9]*$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  echo "Building Python2"
  cd SpiceyPy-$pkgver-py2
  python2 setup.py build
}

package() {
  depends=('python2-six>=1.9.0' 'python2-numpy>=1.8.0')
  optdepends=('python2-pytest>=2.9.0: testing')

  cd SpiceyPy-$pkgver-py2

  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
