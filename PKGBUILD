# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Techmeology <techmeology@techmeology.co.uk>

pkgbase=python-miniupnpc
pkgname=('python-miniupnpc' 'python2-miniupnpc')
pkgver=2.0.20180203
pkgrel=3
pkgdesc="A small UPnP client library/tool to access Internet Gateway Devices"
arch=('x86_64')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools' 'sh')
url="http://miniupnp.free.fr"
license=('BSD')
source=(http://miniupnp.free.fr/files/miniupnpc-${pkgver}.tar.gz)
md5sums=('48fd9c899f77e898c74d2166590da076')

prepare () {
    cp -a miniupnpc{,-py2}-$pkgver 
    find miniupnpc-py2-$pkgver -name \*.py -exec sed -r 's|^#!(.*)python$|#!\1python2|' -i {} +
}

build() {
  echo "Building Python3"
  cd miniupnpc-$pkgver
  make
  python setup.py build

  echo "Building Python2"
  cd ../miniupnpc-py2-$pkgver
  make
  python2 setup.py build
}

package_python-miniupnpc() {
  depends=('python')

  cd miniupnpc-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-miniupnpc() {
  depends=('python2')

  cd miniupnpc-py2-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
