# Maintainer: Mark Weiman <mark dot weriman at markzz dot com>

pkgbase=python-shutilwhich
pkgname=('python-shutilwhich' 'python2-shutilwhich')
pkgver=1.1.0
pkgrel=1
pkgdesc="Python wrappers for calling LaTeX/building LaTeX documents"
arch=('any')
license=('custom')
url="https://pypi.python.org/pypi/latex/${pkgver}"
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("shutilwhich-$pkgver.tar.gz::https://github.com/mbr/shutilwhich/archive/1.1.0.tar.gz")
md5sums=('8a5a43077e8af4d027dfb7b88827022b')

prepare() {
  cp -a "$srcdir/shutilwhich-$pkgver" "$srcdir/shutilwhich-$pkgver-python2"

  find "$srcdir/shutilwhich-$pkgver-python2" -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
}

build() {
  cd "$srcdir/shutilwhich-$pkgver"
  python setup.py build

  cd "$srcdir/shutilwhich-$pkgver-python2"
  python2 setup.py build
}

package_python-shutilwhich() {
  depends=('python' 'python-setuptools')
  cd "$srcdir/shutilwhich-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-shutilwhich() {
  depends=('python2' 'python2-setuptools')
  cd "$srcdir/shutilwhich-$pkgver-python2"
  python setup.py install --root="$pkgdir" --optimize=1
}

