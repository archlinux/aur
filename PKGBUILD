# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-amodem
pkgver=1.11
pkgrel=1
pkgdesc="Audio Modem Communication Library"
arch=('any')
depends=('python2' 'python2-argcomplete' 'python2-numpy' 'python2-six')
makedepends=('python2-setuptools')
url="https://github.com/romanz/amodem"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/a/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('84b4973c8e6ab0383e56f9ba37d0a7e3')
sha256sums=('00a4c19fb8a9e6dff9459a2cb021c0adc5c669ac1658685f2388457c409931c6')

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
