# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-bitcoin
pkgver=1.1.36
pkgrel=1
pkgdesc="Python Bitcoin Tools"
arch=('any')
depends=('python' 'python-six')
makedepends=('python-setuptools')
url="https://github.com/vbuterin/pybitcointools"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/b/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('c8b78413b9c75b498c791c7126144ea5')
sha256sums=('1b45b5bad49b11392ad7fcc3c0dfb9c7596775fba5bfc4af8219f059186609af')
provides=('pybitcointools' 'pybtctool' 'python-bitcoin' 'python-pybitcointools')
conflicts=('pybitcointools' 'pybtctool' 'python-pybitcointools' 'python-python-bitcoinlib')

prepare(){
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Fixing setup.py...'
  sed -i '/data_files.*/d' setup.py
}

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
