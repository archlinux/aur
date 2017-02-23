# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-pycoin
pkgver=0.76
pkgrel=1
pkgdesc="Python-based Bitcoin utility library"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/richardkiss/pycoin"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/8a/ee/bf6d21b9502c784803e54128b5ea68265e6a4319c314149def93360e26e2/pycoin-0.76.tar.gz)
md5sums=('af797098f2aa14bc155ec442595c9c66')
sha256sums=('d1dbd4ecb5b69672523778634c415f37eccda75f00d90c318f3eb243cc63b102')
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
