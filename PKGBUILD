# Maintainer: Clément Démoulins <clement@archivel.fr>

pkgbase=python-easysnmp
_realname=easysnmp
pkgname=('python-easysnmp' 'python2-easysnmp')
pkgver=0.2.5
pkgrel=1
pkgdesc="A blazingly fast and Pythonic SNMP library based on the official Net-SNMP bindings"
arch=('i686' 'x86_64')
url="http://pysnmp.sourceforge.net/"
license=('BSD')
makedepends=('python2' 'python3' 'net-snmp')

source=(https://github.com/kamakazikamikaze/${_realname}/archive/$pkgver.tar.gz)
md5sums=('0c7d1286ae4b570cf4adeb0ba3a2ef67')

prepare() {
    cp -a "${_realname}-$pkgver" "python2-${_realname}-$pkgver"
}

build() {
  cd "$srcdir/${_realname}-$pkgver"
  python setup.py build

  cd "$srcdir/python2-${_realname}-$pkgver"
  python2 setup.py build
}


package_python-easysnmp() {
  depends=('python3' 'net-snmp')

  cd "$srcdir/${_realname}-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


package_python2-easysnmp() {
  depends=('python2' 'net-snmp')

  cd "$srcdir/python2-${_realname}-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

