# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_python=python2
pkgname=$_python-elmextensions
pkgdesc="${_python^} library that contains a few more complex elementary objects for easy importing/usage"
pkgver=0.1.3
pkgrel=1
arch=('any')
url='https://github.com/JeffHoogland/python-elm-extensions'
license=('BSD')
depends=("$_python-efl")
source=("https://github.com/JeffHoogland/python-elm-extensions/archive/$pkgver.tar.gz")
sha256sums=('6833db0b4fba63dd5257a4a86a2fe8b34b1506d7fac64ec7a65163479678d15b')

package() {
  cd "$srcdir/python-elm-extensions-$pkgver"

  [[ "$_python" = "python" ]] && _python=python3
  local _pyver="$(pkg-config --modversion $_python)"
  install -d "$pkgdir/usr/lib/python$_pyver/site-packages/elmextensions/"
  install -m644 elmextensions/*.py "$pkgdir/usr/lib/python$_pyver/site-packages/elmextensions/"

# compile python files
  $_python -m compileall -q "$pkgdir"
  $_python -O -m compileall -q "$pkgdir"

# install license files
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
