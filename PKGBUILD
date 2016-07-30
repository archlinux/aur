# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-pycares
pkgver=2.1.0
pkgrel=1
pkgdesc="Python interface for c-ares"
arch=('i686' 'x86_64')
url="https://github.com/saghul/pycares"
license=('MIT')
depends=('python2')
options=('!emptydirs')
source=("https://github.com/saghul/pycares/archive/pycares-${pkgver}.tar.gz")
md5sums=('2e44481a17088a287066ba60b16abb95')

prepare() {
  cd "$srcdir"

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  cd "$srcdir/pycares-pycares-$pkgver"

  rm -f core.*
  rm -rf build

  python2 setup.py build_ext --inplace --force
  python2 setup.py build
}

package() {
  cd "$srcdir/pycares-pycares-$pkgver"

  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
