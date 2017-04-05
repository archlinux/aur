# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-pycoin
pkgver=0.77
pkgrel=1
pkgdesc="Python-based Bitcoin utility library"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/richardkiss/pycoin"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/b6/59/3438ecb8573429c65504133a8c5fd938c30a32e1693da96a3797419423d0/pycoin-0.77.tar.gz)
md5sums=('42cb1d4be17002c28d2bdb752443d90e')
sha256sums=('c5e2fe86690e72b63000f4cf363851116cb7b96e8eb77b69b710e718d2e251de')
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
