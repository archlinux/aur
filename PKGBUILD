# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-pycoin
pkgver=0.52
pkgrel=1
pkgdesc="Python-based Bitcoin utility library"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/richardkiss/pycoin"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('29c8bede819f55d82f40d514781b99ed')
sha256sums=('03d6f3bd16a737476091ae83e9d6cde7ac23a270a3d5dabf5e1c19dd3cb1492e')
provides=('pycoin' 'python-pycoin')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1

  msg 'Renaming binaries...'
  for _bin in block bu cache_tx fetch_unspent genwallet ku spend tx; do
    mv "$pkgdir/usr/bin/$_bin" "$pkgdir/usr/bin/pycoin-$_bin"
  done
}
