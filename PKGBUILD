# $Id$
# Maintainer: Matteo Triggiani <davvore33@gmail.com>
# Contributor: 
pkgname=('python-pickledb' 'python2-pickledb')
pkgver=0.9.2
pkgrel=1
pkgdesc='pickleDB is lightweight, fast, and simple database based on Python’s own json module'
url='http://packages.python.org/pickleDB/'
arch=('any')
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/p/pickleDB/pickleDB-$pkgver.tar.gz" "LICENSE")
md5sums=('02babaf13cf10782175e3ec6e4d452a5' '173f7ea52700eee04c0d48eb75d6f1cf')
prepare() {
  cp -r "pickleDB-$pkgver" "python-pickledb-$pkgver"
  cp -r "pickleDB-$pkgver" "python2-pickledb-$pkgver"
}

build_python-pickledb() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

build_python2-pickledb() {
  cd "$pkgname-$pkgver"

  python2 setup.py build
}

check_python-pickledb() {
  cd "$pkgname-$pkgver"
  python setup.py test

  cd "$pkgname-$pkgver"
  python2 setup.py test
}

package_python-pickledb() {
  depends=('python-simplejson')
  cd "$pkgname-$pkgver"

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pickledb() {
  depends=('python2-simplejson')
  cd "$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
