# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-bitmerchant
pkgver=0.1.7
pkgrel=1
pkgdesc="Bitcoin/altcoin merchant tools"
arch=('any')
depends=('python2' 'python2-base58' 'python2-ecdsa' 'python2-six')
makedepends=('python2-setuptools')
url="https://github.com/sbuss/bitmerchant"
license=('MIT')
source=(https://pypi.python.org/packages/source/b/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('2f8af9df299af9d529517ffae91b051d')
sha256sums=('921ca2594c3dffc27e35c04b9197ac94bbecd211fe36bcdc1b567f2194dcd793')

prepare() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

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
}
