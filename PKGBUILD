# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-amodem
pkgver=1.12.0
pkgrel=1
pkgdesc="Audio Modem Communication Library"
arch=('any')
depends=('python2' 'python2-argcomplete' 'python2-numpy' 'python2-six')
makedepends=('python2-setuptools')
url="https://github.com/romanz/amodem"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/a/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('577c6f66e4a63e9bb4e55d3a124a0932')
sha256sums=('725a9a57f8f636ba61083b557ee36cfb9b2d30b9a226e1ebd23f15c398357199')

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
