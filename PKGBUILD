# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-ptpython
pkgver=0.20
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
md5sums=('db2d6c13d0c0de6de74c798bff2ef0c9')
sha256sums=('a6ebe6f6e496693c69f460e46296492832b47997a0feea069b386cf9bee5bc4f')
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
