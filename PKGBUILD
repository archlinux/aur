# Maintainer: Mark Weiman <mark dot weriman at markzz dot com>

pkgbase=python-data
pkgname=('python-data' 'python2-data')
pkgver=0.4
pkgrel=1
pkgdesc="Work with unicode/non-unicode data from files or strings uniformly."
arch=('any')
license=('MIT')
url="https://pypi.python.org/pypi/data/${pkgver}"
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("data-$pkgver.tar.gz::https://github.com/mbr/data/archive/0.4.tar.gz")
md5sums=('2e46dfa31545ee3e2a25592b48fc190e')

prepare() {
  cp -a "$srcdir/data-$pkgver" "$srcdir/data-$pkgver-python2"

  find "$srcdir/data-$pkgver-python2" -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
}

build() {
  cd "$srcdir/data-$pkgver"
  python setup.py build

  cd "$srcdir/data-$pkgver-python2"
  python2 setup.py build
}

package_python-data() {
  depends=('python' 'python-setuptools' 'python-funcsigs'
           'python-decorator' 'python-six')
  cd "$srcdir/data-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-data() {
  depends=('python2' 'python2-setuptools' 'python2-funcsigs'
           'python2-decorator' 'python2-six')
  cd "$srcdir/data-$pkgver-python2"
  python2 setup.py install --root="$pkgdir" --optimize=1
  
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

