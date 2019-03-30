# maintainer Storm Dragon <stormdragon2976@gmail.com>

pkgbase='python-txtorcon'
_pkgname='txtorcon'
pkgname=('python2-txtorcon' 'python-txtorcon')
pkgver=19.0.0
pkgrel=1
pkgdesc='A Twisted-based Python asynchronous controller library for Tor'
arch=('any')
url='https://txtorcon.readthedocs.org/'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/meejah/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('5eda79379b2a0adf20a4a1515519ba651e759014073a8cc78587d5d796ce2a60ccf87e49239991a48922365fb43449519659ce18679c0dad4a109f44dd6be64c')

prepare() {
  cp -a ${_pkgname}-${pkgver}{,-py2}  
  sed -i 's:^#!/usr/bin/env python$:\02:' ${_pkgname}-${pkgver}-py2/examples/*.py
  sed -i '77,92 {s/^/#/}' $srcdir/${_pkgname}-${pkgver}-py2/setup.py
}

build() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  python setup.py build
  cd "$srcdir"/${_pkgname}-${pkgver}-py2
  python2 setup.py build
}
 
package_python-txtorcon() {
  depends=('python-geoip' 'python-twisted')
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-txtorcon() {
  depends=('python2-geoip' 'python2-ipaddress' 'python2-twisted')
  cd "$srcdir/${_pkgname}-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
