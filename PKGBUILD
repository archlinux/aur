# $Id$
# Maintainer: Shane Stone <shanewstone at gmail>

pkgname=('python2-spiceypy')
pkgver=2.1.1
pkgrel=1
pkgdesc="A Python wrapper for the NAIF C SPICE Toolkit (N66) written using ctypes."
arch=('any')
url="https://github.com/AndrewAnnex/SpiceyPy"
license=('MIT')
makedepends=('python2-six>=1.9.0' 'python2-numpy>=1.12.0' 'python-certifi>=2017.1.23' 'python2-setuptools')
depends=('python2-six>=1.9.0' 'python2-numpy>=1.12.0' 'python-certifi>=2017.1.23')
optdepends=('python2-pytest>=2.9.0: testing')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewannex/spiceypy/archive/v$pkgver.tar.gz")
md5sums=('a32faf9c4b76c3257329e336c15be8fd')

prepare() {
  mv SpiceyPy-$pkgver SpiceyPy-$pkgver-py2
  cd SpiceyPy-$pkgver-py2

  sed -e "s|#![ ]*/usr/bin/python[0-9]*$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python[0-9]*$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python[0-9]*$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  cd SpiceyPy-$pkgver-py2
  python2 setup.py build
}

package() {
  cd SpiceyPy-$pkgver-py2

  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
