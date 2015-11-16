# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-bitcoin
pkgver=1.1.39
pkgrel=1
pkgdesc="Python Bitcoin Tools"
arch=('any')
depends=('python' 'python-six')
makedepends=('python-setuptools')
url="https://github.com/vbuterin/pybitcointools"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/b/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('4ac3340e282b3ad1316faf16e5fb00ee')
sha256sums=('a55134316a0328987d3b580451036f7f7570324a00a8acce3c2b7706bb904b82')
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
