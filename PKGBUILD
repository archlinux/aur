# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-python-jsonrpc
pkgver=0.8.3
pkgrel=1
pkgdesc="Simple to use Python JSONRPC-Library"
arch=('any')
depends=('python2' 'python2-bunch')
makedepends=('python2-setuptools')
url="https://github.com/gerold-penz/python-jsonrpc"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('dc8735e42690f688ae5c7db5a83b67dd')
sha256sums=('aff6583d0eeb3cd8f80274796a6e0d6c5052e4713c0cffbaf76c95a364561193')
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
