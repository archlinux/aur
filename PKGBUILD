# Maintainer: Sébastien Luttringer

pkgbase=pyev
pkgname=('python-pyev' 'python2-pyev')
pkgver=0.9.0
pkgrel=1
pkgdesc='Python libev interface'
arch=('i686' 'x86_64')
url='https://pypi.python.org/pypi/pyev'
license=('GPL')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools' 'libev')
source=("https://pypi.python.org/packages/source/p/pyev/pyev-$pkgver.tar.gz")
md5sums=('9d7466c84c4fc57a5d2f02d89da82b7b')

build() {
  cd $pkgbase-$pkgver

  msg2 python
  python setup.py build --build-lib=build/python

  msg2 python2
  python2 setup.py build --build-lib=build/python2
  find build/python2 -type f -exec \
    sed -i '1s,^#! \?/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' {} \;
}

package_python-pyev() {
  pkgdesc='A cross-platform process and system utilities module for Python'
  depends=('glibc' 'libev' 'python')

  cd $pkgbase-$pkgver
  python setup.py build --build-lib=build/python \
                  install --root="$pkgdir" --optimize=1
}

package_python2-pyev() {
  pkgdesc='A cross-platform process and system utilities module for Python2'
  depends=('glibc' 'libev' 'python2')

  cd $pkgbase-$pkgver
  python2 setup.py build --build-lib=build/python2 \
                   install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
