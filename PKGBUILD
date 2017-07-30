# Maintainer: Mark Weiman <mark dot weriman at markzz dot com>

pkgbase=python-tempdir
pkgname=('python-tempdir' 'python2-tempdir')
pkgver=0.7.1
pkgrel=1
pkgdesc="Python wrappers for manipulating temp directories"
arch=('any')
license=('MIT')
url="https://pypi.python.org/pypi/tempdir/${pkgver}"
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/t/tempdir/tempdir-${pkgver}.tar.gz")
md5sums=('4076f2d7fa9306c77f7b16a5f2e4c154')

prepare() {
  cp -a "$srcdir/tempdir-$pkgver" "$srcdir/tempdir-$pkgver-python2"

  find "$srcdir/tempdir-$pkgver-python2" -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
}

build() {
  cd "$srcdir/tempdir-$pkgver"
  python setup.py build

  cd "$srcdir/tempdir-$pkgver-python2"
  python2 setup.py build
}

package_python-tempdir() {
  depends=('python' 'python-setuptools')
  cd "$srcdir/tempdir-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  
  install -Dm644 docs/license.rst "$pkgdir"/usr/share/licenses/$pkgname/license.rst
}

package_python2-tempdir() {
  depends=('python2' 'python2-setuptools')
  cd "$srcdir/tempdir-$pkgver-python2"
  python2 setup.py install --root="$pkgdir" --optimize=1
  
  install -Dm644 docs/license.rst "$pkgdir"/usr/share/licenses/$pkgname/license.rst
}

