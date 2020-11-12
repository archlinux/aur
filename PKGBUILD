# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-genty
pkgname=('python-genty' 'python2-genty')
pkgver=1.3.2
pkgrel=7
pkgdesc="Allows you to run a test with multiple data sets"
arch=('any')
license=('Apache')
url="https://github.com/box/genty"
makedepends=('python-setuptools' 'python2-setuptools' 'python-six' 'python2-six' 'git')
checkdepends=('python-mock' 'python2-mock')
source=("git+https://github.com/box/genty.git#tag=v$pkgver")
sha512sums=('SKIP')

prepare() {
  cp -a genty{,-py2}
}

build() {
  cd "$srcdir/genty"
  python setup.py build

  cd "$srcdir/genty-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/genty"
  python setup.py test

  cd "$srcdir/genty-py2"
  python2 setup.py test
}

package_python-genty() {
  depends=('python-six')

  cd genty
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-genty() {
  depends=('python2-six')

  cd genty-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
