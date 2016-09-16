# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>

pkgbase="python-sacred"
pkgname=("python-sacred" "python2-sacred")
_pkgname="sacred"
pkgver="0.6.10"
pkgrel="1"
pkgdesc='Sacred is a tool to configure, organize, log and reproduce computational experiments.'
arch=('any')
url='https://github.com/IDSIA/sacred'
license=('MIT')
depends=('python' 'python-docopt' 'python-six' 'python-wrapt'
         'python2' 'python2-docopt' 'python2-six' 'python2-wrapt')
makedepends=('python-distribute'
             'python2-distribute')
optdepends=('python-numpy' 'python-pymongo'
            'python2-numpy' 'python2-pymongo')
source=("https://pypi.python.org/packages/3a/3d/7472f176cac6652dcb0ec7021afe3617e4ec0d2db10375990feba575cdb2/sacred-$pkgver.tar.gz")
md5sums=('1ee4422677abf134ce435cece8cdac13')

prepare() {
  cd "$srcdir/"
  cp -a "$_pkgname-$pkgver" "$_pkgname-$pkgver-py2"
  cd "$_pkgname-$pkgver"
  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  msg "Building Python 2"
  cd "$srcdir/$_pkgname-$pkgver-py2"
  python2 setup.py build

  msg "Building Python 3"
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package_python2-sacred() {
  depends=('python2' 'python2-docopt' 'python2-six' 'python2-wrapt')
  cd "$srcdir/$_pkgname-$pkgver-py2"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
}

package_python-sacred() {
  depends=('python' 'python-docopt' 'python-six' 'python-wrapt')
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
