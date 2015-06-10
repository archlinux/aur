# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-structlog
pkgver=15.2.0
pkgrel=1
pkgdesc="Structured logging for Python"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="http://www.structlog.org"
license=('Apache' 'MIT')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/s/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz"{,.asc})
md5sums=('245dcd145d14e7633e3d089cebcaf327'
         'SKIP')
sha256sums=('fbd9cac9537dd2370a2d8580113e5a02b8b136b7c2fb9d25c476ef4d220b16b5'
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
