# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-openassets
pkgver=1.3
pkgrel=1
pkgdesc="Reference implementation of the Open Assets Protocol"
arch=('any')
depends=('python' 'python-python-bitcoinlib')
makedepends=('python-setuptools')
url="https://github.com/OpenAssets/openassets"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/o/${pkgname#python-}/${pkgname#python-}-$pkgver.zip)
md5sums=('25a8d570b2b0c3dd8e28b947a3efcacc')
sha256sums=('d06ba02ec96303dc8ec50ad9b38911e3fbfc9b3df07fddd3e00206acdb7e8ac0')

prepare() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Fixing required bitcoinlib version...'
  sed -i "s/'python-bitcoinlib.*/'python-bitcoinlib >= 0.2.1'/" setup.py
  sed -i "s/python-bitcoinlib.*/python-bitcoinlib >= 0.2.1/" openassets.egg-info/requires.txt
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
