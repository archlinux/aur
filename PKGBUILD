# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgbase=python-zope.testing
_pkgname=${pkgbase#python-}
pkgname=(python-$_pkgname python2-$_pkgname)
pkgver=4.6.2
pkgrel=1
arch=('any')
pkgdesc="Zope testing frameworks"
url="https://github.com/zopefoundation/$_pkgname"
license=('custom:ZPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('5eb5946ca22ac29138a43660a0d28282a0cd89ed9c18aab01ac0fa62107d79b4ff8d5c4b4278b8ddb5ef578e71d9f48eb6c1ded619c43917ccba0bd4a5167d1f')

prepare() {
  cp -a $_pkgname-$pkgver{,-py2}
}

build() {
  msg2 "Building python-$_pkgname $pkgver"
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py build

  msg2 "Building python2-$_pkgname $pkgver"
  cd "$srcdir"/$_pkgname-$pkgver-py2
  python2 setup.py build
}

check() {
  msg2 "Running tests on python-$_pkgname $pkgver"
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py -q test -q

  msg2 "Running tests on python2-$_pkgname $pkgver"
  cd "$srcdir"/$_pkgname-$pkgver-py2
  python2 setup.py -q test -q
}

package_python-zope.testing() {
  depends=('python')
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-zope.testing() {
  depends=('python2')
  cd $_pkgname-$pkgver-py2

  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
