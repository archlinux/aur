# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-ptpython
pkgver=0.18
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
md5sums=('2159864e67fa1640b2fbf6f214a1950f')
sha256sums=('be231639bd0dba13c1dc34af1728111bd8a2bf2b25bb18b3b58ad7a28432668d')
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
