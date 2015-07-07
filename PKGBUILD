# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-ets
pkgver=4.4.4
pkgrel=1
pkgdesc="Enthought Tool Suite"
arch=('any')
url="https://github.com/enthought/ets"
license=('BSD')
depends=('python2-apptools' 'python2-blockcanvas'
         'python2-chaco' 'python2-codetools' 'python2-enable'
         'python2-encore' 'python2-envisage' 'python2-etsdevtools'
         'python2-etsproxy' 'python2-graphcanvas' 'python2-mayavi'
         'python2-pyface' 'python2-scimath' 'python2-traits'
         'python2-traitsui')
makedepends=('python2-setuptools')
conflicts=('python2-ets-git')
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::https://github.com/enthought/ets/archive/${pkgver}.tar.gz")
md5sums=('002dd92971422b3fbd5e628db6652d59')

prepare() {
  cd "$srcdir"/ets-$pkgver

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find -name '*.py')
}

build() {
  cd "$srcdir"/ets-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir"/ets-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

