# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-bitmerchant
pkgver=0.1.5
pkgrel=1
pkgdesc="Bitcoin merchant tools"
arch=('i686' 'x86_64')
depends=('python2' 'python2-base58' 'python2-crypto' 'python2-ecdsa' 'python2-six')
makedepends=('python2-setuptools')
url="https://pypi.python.org/pypi/bitmerchant"
license=('MIT')
source=(https://pypi.python.org/packages/source/b/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('04cd8e0e8685cf677d940d7107c1565f')
sha256sums=('6a151e933e15dabc2539f1dc2d35daa073f7a0228ac0fa912c505b933347752f')
provides=('bitmerchant' 'python2-bitmerchant')
conflicts=('bitmerchant' 'python2-bitmerchant')

prepare() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
