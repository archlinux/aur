# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-bitcoin
pkgver=1.1.29
pkgrel=1
pkgdesc="Python Bitcoin Tools"
arch=('any')
depends=('python' 'python-six')
makedepends=('python-setuptools')
url="https://github.com/vbuterin/pybitcointools"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/b/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('c82c9684642fb6166de3b77bdb0b4b9a')
sha256sums=('18a38854025acb9b321cc3456aad54447e597cac4cdc52b4cd08dd5436a508a6')
provides=('pybitcointools' 'pybtctool' 'python-bitcoin' 'python-pybitcointools')
conflicts=('pybitcointools' 'pybtctool' 'python-pybitcointools' 'python-python-bitcoinlib')

prepare(){
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Fixing setup.py...'
  sed -i '/data_files.*/d' setup.py
}

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
