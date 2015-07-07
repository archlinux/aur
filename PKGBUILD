# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-etsproxy
pkgver=0.1.2
pkgrel=1
pkgdesc="ETS Proxy Modules for Backwards Compatibility"
arch=('any')
url="https://github.com/enthought/etsproxy"
license=('BSD')
depends=('python2')
makedepends=('python2-distribute')
conflicts=('python2-etsproxy-git'
           'python2-enthoughtbase' 'python2-envisagecore' 'python2-envisageplugins'
           'python2-traitsbackendwx' 'python2-traitsbackendqt' 'python2-traitsgui')
provides=('python2-enthoughtbase=3.1.0' 'python2-envisagecore=3.2.0' 'python2-envisageplugins=3.2.0'
          'python2-traitsbackendwx=3.6.0' 'python2-traitsbackendqt=3.6.0' 'python2-traitsgui=3.6.0')

options=(!emptydirs)

source=("https://github.com/enthought/etsproxy/archive/${pkgver}.tar.gz")
md5sums=('dfde9ff789238db38e3fc90fa8131b84')

build() {
  cd "$srcdir"/etsproxy-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir"/etsproxy-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${pkgdir}" -name '*.py')

  install -D "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

