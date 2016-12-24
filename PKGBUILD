# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-nose-fixes
pkgname=("python-nose-fixes" "python2-nose-fixes")
pkgver=1.3
pkgrel=2
pkgdesc="A plugin to make nose behave better"
arch=('any')
url="https://github.com/cjw296/nose_fixes"
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools' 'python-nose' 'python2-nose' 'git')
checkdepends=('python-testfixtures' 'python2-testfixtures')
source=("git+https://github.com/cjw296/nose_fixes.git#tag=$pkgver")
sha512sums=('SKIP')

prepare() {
  cp -a "nose_fixes"{,-py2}
}

build() {
  cd "$srcdir/nose_fixes"
  python setup.py build

  cd "$srcdir/nose_fixes-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/nose_fixes"
  nosetests3

  cd "$srcdir/nose_fixes-py2"
  nosetests2
}

package_python-nose-fixes() {
  depends=('python-nose')

  cd nose_fixes
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-nose-fixes() {
  depends=('python2-nose')

  cd nose_fixes-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
