# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-bitcoin
pkgver=1.1.37
pkgrel=1
pkgdesc="Python Bitcoin Tools"
arch=('any')
depends=('python' 'python-six')
makedepends=('python-setuptools')
url="https://github.com/vbuterin/pybitcointools"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/b/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('06e33709f1cc3c82cff7250cdf259ca5')
sha256sums=('53df812d3c93cfd9aa32c5b9365de1889eef58dd9cfd310f61614057665a44ed')
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
