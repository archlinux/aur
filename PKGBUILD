# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-plyvel
pkgver=0.9
pkgrel=1
pkgdesc="A fast and feature-rich Python interface to LevelDB"
arch=('i686' 'x86_64')
depends=('leveldb' 'python2')
makedepends=('cython2' 'gcc' 'make' 'python2-setuptools')
url="https://github.com/wbolster/plyvel"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('b0f768a07683dad01554b040c6320ed5')
sha256sums=('587d93681ae44936ae086b4b45486eb302e3853ba5af149aac3be9e9713998e9')

prepare(){
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Fixing Python version...'
  sed -i 's#python#python2#' Makefile
  sed -i 's#cython#cython2#' Makefile
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  make
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
