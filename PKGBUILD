# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgbase=python-pefile
pkgname=('python-pefile' 'python2-pefile')
pkgver=2016.3.4
pkgrel=3
pkgdesc="Python PE parsing module"
arch=('any')
url="https://github.com/erocarrera/pefile"
license=('MIT')
makedepends=('python' 'python2' 'python-future' 'python2-future') 
source=("https://github.com/erocarrera/pefile/releases/download/v${pkgver}/pefile-${pkgver}.tar.gz")
sha256sums=('51d149b31d0eeb5c97c67ee6a05b529d9fab37557d59d82c1f489560dc0b66f7')

prepare() {
  cd $srcdir
  cp -r pefile-$pkgver pefile2-$pkgver
}

check() {
  cd $srcdir/pefile-$pkgver 
  python setup.py check
  
  cd $srcdir/pefile2-$pkgver 
  python2 setup.py check  
}

package_python-pefile() {
  depends=('python' 'python-future')
  cd "$srcdir/pefile-$pkgver"
  python setup.py install --root "${pkgdir}" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

package_python2-pefile() {
  depends=('python2' 'python2-future')
  cd "$srcdir/pefile2-$pkgver"
  python2 setup.py install --root "${pkgdir}" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set et sw=2 ts=2 tw=79:
