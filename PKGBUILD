# maintainer Storm Dragon <stormdragon2976@gmail.com>

pkgbase='python-txtorcon'
_pkgname='txtorcon'
pkgname=('python2-txtorcon' 'python-txtorcon')
pkgver=0.19.3
pkgrel=3
pkgdesc='A Twisted-based Python asynchronous controller library for Tor'
arch=('any')
url='https://txtorcon.readthedocs.org/'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/meejah/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('37b87507e96e4210988c5bb45b64273238e101c77b51702535d2cd46d241b3e3') 

prepare() {
  cp -a ${_pkgname}-${pkgver}{,-py2}  
  sed -i 's:^#!/usr/bin/env python$:\02:' ${_pkgname}-${pkgver}-py2/examples/*.py
  sed -i '77,91 {s/^/#/}' $srcdir/${_pkgname}-${pkgver}-py2/setup.py
}

build() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  python setup.py build
  cd "$srcdir"/${_pkgname}-${pkgver}-py2
  python2 setup.py build
}
 
package_python-txtorcon() {
  depends=('python-geoip' 'python-ipaddress' 'python-twisted')
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
