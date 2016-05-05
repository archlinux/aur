# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-ptpython
pkgver=0.33
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
source=(https://pypi.python.org/packages/46/68/aeff7b6e1ed9e519eb2ef11fa78cc73e04a27b08f69f3c8ea23fc30736d4/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('52c0e13ffe8d60d49b7636ac0d3d2aef')
sha256sums=('86bb8bc6b3b2e4c7d4b400867d53fd94ffc4fe029d146f7a54d4e53160479435')
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
