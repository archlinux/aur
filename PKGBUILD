# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-pycoin
pkgver=0.61
pkgrel=1
pkgdesc="Python-based Bitcoin utility library"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/richardkiss/pycoin"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('c5f1cc46487e585ea21af3c5cc416392')
sha256sums=('4ea2ee72c455e477a4b680888fa133b3b6755f65b00327d0acf2c3398793654e')
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
