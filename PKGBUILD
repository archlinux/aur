# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-pycoin
pkgver=0.62
pkgrel=1
pkgdesc="Python-based Bitcoin utility library"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/richardkiss/pycoin"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('14306b883b6c82bc59023bee7687398e')
sha256sums=('289b059339b07ccfdd828ead412218369730c12ba93fe50222d2707a276d2f55')
provides=('pycoin' 'python-pycoin')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1

  msg2 'Renaming binaries...'
  for _bin in $(find "$pkgdir/usr/bin" -mindepth 1 -type f -printf '%f\n'); do
    mv "$pkgdir/usr/bin/$_bin" "$pkgdir/usr/bin/pycoin-$_bin"
  done
}
