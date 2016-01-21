# Maintainer: M0Rf30

pkgname=python2-bitcointools
pkgver=1.1.43
pkgrel=1
pkgdesc="Python Bitcoin Tools (fork for OpenBazaar)"
arch=('any')
depends=('python2' 'python2-six')
makedepends=('python2-setuptools')
url="https://github.com/vbuterin/pybitcointools"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/b/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)

prepare(){
  cd "$srcdir/${pkgname#python2-}-$pkgver"

#  msg2 'Fixing Python version...'
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
  touch LICENSE
  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg2 'Renaming pybtctool to pybtctool2...'
  rm -rf "$pkgdir/usr/bin/"
}

md5sums=('aa92a040a06b5a6dbdec84fe5242ea06')
