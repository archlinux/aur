# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-structlog
pkgver=15.1.0
pkgrel=1
pkgdesc="Structured logging for Python"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="http://www.structlog.org"
license=('Apache' 'MIT')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/s/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz"{,.asc})
md5sums=('c8e2b395b74031202f24e800e10be669'
         'SKIP')
sha256sums=('1017abfe5e8cd292da859368a5d372e8a3c3b4d353cf6fd27cc13cda32f152cb'
            'SKIP')
validpgpkeys=('C2A04F86ACE28ADCF817DBB7AE2536227F69F181')

prepare(){
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
