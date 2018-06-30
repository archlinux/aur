# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgbase=PyBrowserID
pkgbase=python-browserid
pkgname=('python2-browserid' 'python-browserid')
pkgver=0.14.0
pkgrel=2
pkgdesc="Python client library for the BrowserID protocol"
arch=('any')
url="https://github.com/mozilla/PyBrowserID"
license=('MPL2')
depends=('python-requests' 'python2-requests')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/mozilla/$_pkgbase/archive/$pkgver.tar.gz")
sha256sums=('2a59531db7a847fbc1cdd0449e601149e3bab33a8b5629f23bc40c5794b83932')

prepare() {
  cp -a $_pkgbase-$pkgver{,-py2}
}

build() {
  # Building Python2
  cd $_pkgbase-$pkgver-py2
  python2 setup.py build

  # Building Python3
  cd ../$_pkgbase-$pkgver
  python3 setup.py build
}

package_python2-browserid() {
  depends=('python2-requests')

  cd $_pkgbase-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}

package_python-browserid() {
  depends=('python-requests')

  cd $_pkgbase-$pkgver 
  python3 setup.py install --root="$pkgdir" --optimize=1
}
