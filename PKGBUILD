# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-structlog
pkgver=15.3.0
pkgrel=1
pkgdesc="Structured logging for Python"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="http://www.structlog.org"
license=('Apache' 'MIT')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/s/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz"{,.asc})
md5sums=('373666bf2cfb5677182e382f7f38e6c2'
         'SKIP')
sha256sums=('87276738473ff00014f3f6ce9adf559d142ca4a71567805c46f09ea61df938c1'
            'SKIP')
validpgpkeys=('C2A04F86ACE28ADCF817DBB7AE2536227F69F181')

prepare(){
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
