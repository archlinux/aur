# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-python-jsonrpc
pkgver=0.8.4
pkgrel=1
pkgdesc="Simple to use Python JSONRPC-Library"
arch=('any')
depends=('python2' 'python2-bunch')
makedepends=('python2-setuptools')
url="https://github.com/gerold-penz/python-jsonrpc"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('423abb23bdf9473e34fed7139ab3564a')
sha256sums=('6caeaae64c9b850f28503f1cf9b2a3d012d28d8b6763fdb1919ae96f090b3681')
provides=('pyjsonrpc' 'python2-pyjsonrpc' 'python2-python-jsonrpc')

prepare(){
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
