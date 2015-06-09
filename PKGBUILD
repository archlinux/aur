# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-amodem
pkgver=1.10
pkgrel=1
pkgdesc="Audio Modem Communication Library"
arch=('any')
depends=('python2' 'python2-argcomplete' 'python2-numpy' 'python2-six')
makedepends=('python2-setuptools')
url="https://github.com/romanz/amodem"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/a/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('c03ed52401b0501fc775466eed713a08')
sha256sums=('a3ba8fc29230d40e0077040561e47b2626a375ca2a42e31aed1401187ae2c421')

prepare() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
