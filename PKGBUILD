# Maintainer: M0Rf30

pkgname=python2-bitcointools
pkgver=1.1.44
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

msg2 'Removing /usr/bin folder'
  rm -rf "$pkgdir/usr/bin/"
}

md5sums=('1c2e09cc9706e14840be61f2bd160220')
