# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-bitcoin
pkgver=1.1.38
pkgrel=1
pkgdesc="Python Bitcoin Tools"
arch=('any')
depends=('python2' 'python2-six')
makedepends=('python2-setuptools')
url="https://github.com/vbuterin/pybitcointools"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/b/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('075a19b4636841900336c93c56eaa86b')
sha256sums=('b58f2bdf1427644e3786f5ec727d77fb97e304fa57cbf2060b46dbb406c13895')
provides=('pybitcointools2' 'pybtctool2' 'python2-bitcoin' 'python2-pybitcointools')
conflicts=('pybitcointools2' 'pybtctool2' 'python2-pybitcointools' 'python2-python-bitcoinlib')

prepare(){
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Fixing setup.py...'
  sed -i '/data_files.*/d' setup.py

  msg2 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg2 'Renaming pybtctool to pybtctool2...'
  mv "$pkgdir/usr/bin/pybtctool" "$pkgdir/usr/bin/pybtctool2"
}
