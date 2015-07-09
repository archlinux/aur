# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-pycares
pkgver=0.7.0
pkgrel=1
pkgdesc="Python interface for c-ares"
arch=('i686' 'x86_64')
url="https://github.com/saghul/pycares"
license=('MIT')
depends=('python2')
options=('!emptydirs')
source=("https://pypi.python.org/packages/source/p/pycares/pycares-${pkgver}.tar.gz")
md5sums=('b20fee2c619028b19977f0d5efaa9666')

prepare() {
  cd "$srcdir"

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  cd "$srcdir/pycares-$pkgver"

  rm -f core.*
  rm -rf build

  python2 setup.py build_ext --inplace --force
  python2 setup.py build
}

package() {
  cd "$srcdir/pycares-$pkgver"

  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
