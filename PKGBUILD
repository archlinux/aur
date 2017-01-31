# $Id$
# Maintainer: Daniel Milde <daniel@milde.cz>

pkgbase=pypy-packaging
pkgname=(pypy-packaging pypy3-packaging)
pkgver=16.8
pkgrel=1
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
makedepends=('pypy-setuptools' 'pypy3-setuptools' 'pypy-pyparsing' 'pypy3-pyparsing' 'git')
source=("git+https://github.com/pypa/packaging.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a packaging{,-py2}
}

build() {
  cd "$srcdir"/packaging
  pypy3 setup.py build

  cd "$srcdir"/packaging-py2
  pypy setup.py build
}

package_pypy3-packaging() {
  depends=('pypy3-pyparsing' 'pypy3-six')

  cd "$srcdir"/packaging
  pypy3 setup.py install --prefix=/opt/pypy3 --root "$pkgdir"
}

package_pypy-packaging() {
  depends=('pypy-pyparsing' 'pypy-six')

  cd "$srcdir"/packaging-py2
  pypy setup.py install --prefix=/opt/pypy --root "$pkgdir"
}
