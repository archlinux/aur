# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-amodem
pkgver=1.13
pkgrel=2
pkgdesc="Audio Modem Communication Library"
arch=('any')
depends=('python2' 'python2-argcomplete' 'python2-numpy' 'python2-six')
makedepends=('python2-setuptools')
url="https://github.com/romanz/amodem"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/a/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('de594776d139a5e748c8e0c220ca8179')
sha256sums=('e24145268ffd0540754d5ce17a21b2602488cd6f0b7be2907f1734e60f73ccc1')

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
