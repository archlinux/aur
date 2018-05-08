# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgbase=python-niapy
pkgname=('python2-niapy' 'python-niapy')
pkgver=1.0.1
pkgrel=1
pkgdesc="Python microframework for building nature-inspired algorithms"
url="https://github.com/NiaOrg/NiaPy"
arch=('any')
license=('MIT')
makedepends=('python2-setuptools' 'python-setuptools' 'python-scipy' 'python2-scipy' 'python-click' 'python2-click' 'python-xlsxwriter' 'python2-xlsxwriter')
source=($pkgbase-$pkgver.tar.gz::https://github.com/NiaOrg/NiaPy/archive/$pkgver.tar.gz)
md5sums=('7bbf957f02bafd880d6de23e1ec7e557')

prepare() {
  cd "$srcdir"
  cp -a NiaPy-$pkgver NiaPy-py2-$pkgver
  cd NiaPy-py2-$pkgver

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  msg "Building Python2"
  cd "$srcdir"/NiaPy-py2-$pkgver
  python2 setup.py build

  msg "Building Python3"
  cd "$srcdir"/NiaPy-$pkgver
  python setup.py build
}

package_python2-niapy() {
  depends=('python2-scipy' 'python2-click' 'python2-xlsxwriter')

  cd "$srcdir"/NiaPy-py2-$pkgver

  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python-niapy() {
  depends=('python-scipy' 'python-click' 'python-xlsxwriter')

  cd "$srcdir"/NiaPy-$pkgver

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
