# Maintainer: Sergey Kotsur <kotsursv@gmail.com>

pkgbase=python-backports.weakref
pkgname=(python-backports.weakref python2-backports.weakref)
_pkgname=backports.weakref
pkgver=1.0rc1
pkgrel=2
pkgdesc="Package provides backports of new features in Python's weakref module under the backports namespace"
arch=('x86_64')
url="https://pypi.python.org/pypi/backports.weakref"
license=('custom')
makedepends=('python2-setuptools' 'python-setuptools')
depends=('python2-backports')
source=(https://pypi.python.org/packages/source/b/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('c3dcb466fe3bbd72b6af87c0fa547f24')

prepare() {
  cp -a "$_pkgname-$pkgver"{,-py2}
}

build() {
  cd "$srcdir"/"$_pkgname-$pkgver"
  python3 setup.py build

  cd "$srcdir"/"$_pkgname-$pkgver"-py2
  python2 setup.py build
}

package_python2-backports.weakref() {
  cd $_pkgname-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  rm "$pkgdir/usr/lib/python2.7/site-packages/backports/__init__.py"*
}

package_python-backports.weakref() {
  cd $_pkgname-$pkgver
  python3 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
