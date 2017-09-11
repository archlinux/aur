# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-pycoin
pkgver=0.80
pkgrel=1
pkgdesc="Utilities for Bitcoin and altcoin addresses and transaction manipulation"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/richardkiss/pycoin"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/6e/59/02788d66761804864da917e353f1e397714165ad78cee2cca9d37b780c08/pycoin-0.80.tar.gz)
md5sums=('56025aac481c06867796cd83a07eb4eb')
sha256sums=('a79a7771c3f6ca2e35667e80983987f0c799c5db01e58016c22a12e8484b2034')
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
