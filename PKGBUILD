# Maintainer: Mark Weiman <mark dot weriman at markzz dot com>

pkgbase=python-evtx
pkgname=('python-evtx' 'python2-evtx')
pkgver=0.6.1
pkgrel=1
pkgdesc="Python library for parsing evtx files"
arch=('any')
license=('Apache')
url="https://pypi.python.org/pypi/evtx/${pkgver}"
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("evtx-$pkgver.tar.gz::https://github.com/williballenthin/python-evtx/archive/v$pkgver.tar.gz")
md5sums=('ae32c631b9cc2c528a44f216f24f8aeb')

prepare() {
  cp -a "$srcdir/python-evtx-$pkgver" "$srcdir/python2-evtx-$pkgver"

  find "$srcdir/python2-evtx-$pkgver" -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
}

build() {
  cd "$srcdir/python-evtx-$pkgver"
  python setup.py build

  cd "$srcdir/python2-evtx-$pkgver"
  python2 setup.py build
}

package_python-evtx() {
  cd "$srcdir/python-evtx-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  
  install -Dm644 LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-evtx() {
  cd "$srcdir/python2-evtx-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  
  install -Dm644 LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

