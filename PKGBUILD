# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgbase=python-pefile
pkgname=('python-pefile' 'python2-pefile')
pkgver=2016.3.4
pkgrel=1
pkgdesc="Python PE parsing module"
arch=('any')
url="https://github.com/erocarrera/pefile"
license=('MIT')
makedepends=('python' 'python2') 
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
}

package_python2-pefile() {
  depends=('python2' 'python-future')
  cd "$srcdir/pefile2-$pkgver"
  python2 setup.py install --root "${pkgdir}" --optimize=1
}
