# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-python-jsonrpc
pkgver=0.7.7
pkgrel=1
pkgdesc="Simple to use Python JSONRPC-Library"
arch=('any')
depends=('python2' 'python2-bunch')
makedepends=('python2-setuptools')
url="https://github.com/gerold-penz/python-jsonrpc"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('02f5ec6965d20467adda7aa2daa77083')
sha256sums=('e8342355920d7edffef4e8b26caa585363fe410a6ba1b985ea084bdc824b8cb2')
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
