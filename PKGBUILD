# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-ptpython
pkgver=0.16
pkgrel=1
pkgdesc="Interactive Python prompt with syntax highlighting and code completion"
arch=('any')
depends=('python2'
         'python2-docopt'
         'python2-jedi'
         'python2-prompt_toolkit')
makedepends=('python2-setuptools')
optdepends=('ipython2: ptipython2')
url="https://github.com/jonathanslenders/ptpython"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('2396f80c5d329f61f5f25d20cfa21db0')
sha256sums=('50737e5d3c16e0c447c2865dd5b5f66e9de0956a86be07dcce14335ef1e7c1d5')
provides=('ptpython2' 'python2-ptpython')
conflicts=('ptpython2')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg2 'Renaming executables...'
  mv "$pkgdir/usr/bin/ptipython" "$pkgdir/usr/bin/ptipython2"
  mv "$pkgdir/usr/bin/ptpython" "$pkgdir/usr/bin/ptpython2"
}
