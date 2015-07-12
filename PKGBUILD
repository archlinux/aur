# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-python-jsonrpc
pkgver=0.7.10
pkgrel=1
pkgdesc="Simple to use Python JSONRPC-Library"
arch=('any')
depends=('python2' 'python2-bunch')
makedepends=('python2-setuptools')
url="https://github.com/gerold-penz/python-jsonrpc"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('7edd99673206a0243219912047d5fe93')
sha256sums=('6645eeaf3760f2cfddaf6a1b768ac81f4d047e328e133fa7aae3d2ed44a2521b')
provides=('pyjsonrpc' 'python2-pyjsonrpc' 'python2-python-jsonrpc')

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
