# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=arpy
pkgname=('python-arpy' 'python2-arpy')
pkgbase=python-$_name
pkgver=1.1.1
pkgrel=1
pkgdesc="Library for accessing 'ar' files"
arch=(any)
url="https://pypi.python.org/pypi/$_name"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://pypi.python.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('3ec36309d2234648ef8dcd2118fe7d81c30195087e0353473546583f3434e776')

prepare() {
  cp -a $_name-$pkgver{,-py2}
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build

  cd "$srcdir/$_name-$pkgver-py2"
  python2 setup.py build
}

package_python-arpy() {
  depends=('python')
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python2-arpy() {
  depends=('python2')
  cd "$srcdir/$_name-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
