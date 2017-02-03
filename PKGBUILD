# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net
_srcname=srp
pkgbase=python-srp
pkgname=(python-$_srcname python2-$_srcname)
pkgver=1.0.6
pkgrel=1
pkgdesc='Python implementation of the Secure Remote Password protocol (SRP)'
arch=('any')
url="https://github.com/cocagne/py$_srcname"
license=('MIT')
makedepends=('python' 'python2')
source=("https://files.pythonhosted.org/packages/source/${_srcname::1}/${_srcname}/${_srcname}-${pkgver}.tar.gz")
md5sums=('199d02926e61444891ff0342de49393e')

prepare() {
  cd "$srcdir"
  cp -a $_srcname-$pkgver{,-py2}
}

build() {
  cd "$srcdir/$_srcname-$pkgver"
  python setup.py build

  cd "$srcdir/$_srcname-$pkgver-py2"
  python2 setup.py build
}

check() {
  # Test script isn’t compatible with Python 3 by the looks of it
  #cd "$srcdir/$_srcname-$pkgver"
  #python srp/test_srp.py

  cd "$srcdir/$_srcname-$pkgver-py2"
  python2 srp/test_srp.py
}

package_python-srp() {
  depends=('python')

  cd "$srcdir/$_srcname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-srp() {
  depends=('python2')

  cd "$srcdir/$_srcname-$pkgver-py2"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
