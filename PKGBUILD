# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-ffnet
pkgver=0.8.0
pkgrel=1
pkgdesc="Feed-forward neural network solution for python"
arch=('i686' 'x86_64')
url="http://ffnet.sourceforge.net/"
license=('GPL')
depends=('python2')
options=('!emptydirs')
source=("https://pypi.python.org/packages/source/f/ffnet/ffnet-${pkgver}.tar.gz")
md5sums=('ebffdc0c69a7b7fb8f61807aee3fab1d')

prepare() {
  cd "$srcdir"

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  cd "$srcdir/ffnet-$pkgver"

  unset LDFLAGS
  python2 setup.py build
}

package() {
  cd "$srcdir/ffnet-$pkgver"

  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
