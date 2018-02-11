# Maintainer: Techmeology <techmeology@techmeology.co.uk>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgbase=python-miniupnpc
pkgname=(python-miniupnpc python2-miniupnpc)
pkgver=2.0.20180203
pkgrel=3
pkgdesc="A small UPnP client library/tool to access Internet Gateway Devices"
arch=('i686' 'x86_64')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
url="http://miniupnp.free.fr"
license=('custom')
options=(!emptydirs)
source=(http://miniupnp.free.fr/files/${pkgbase#python-}-${pkgver}.tar.gz)
md5sums=('48fd9c899f77e898c74d2166590da076')

prepare () {
    cp -rup $srcdir/${pkgbase#python-}-${pkgver} $srcdir/${pkgbase#python-}-${pkgver}-python2
}

build() {
  cd $srcdir/${pkgbase#python-}-${pkgver}
  make
  python setup.py build

  cd $srcdir/${pkgbase#python-}-${pkgver}-python2
  make
  python2 setup.py build

}

package_python-miniupnpc() {
  depends=('python')
  conflicts=('python2-miniupnpc')
  cd $srcdir/${pkgbase#python-}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-miniupnpc() {
  depends=('python2')
  conflicts=('python-miniupnpc')
  cd $srcdir/${pkgbase#python-}-${pkgver}
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
