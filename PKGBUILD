# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-http-parser
pkgver=0.8.3
pkgrel=1
pkgdesc="HTTP request/response parser for Python in C"
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/benoitc/http-parser"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/h/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('751967e2785c829dffebdc9a511e0eec')
sha256sums=('e2aff90a60def3e476bd71694d8757c0f95ebf2fedf0a8ae34ee306e0b20db83')

prepare(){
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
