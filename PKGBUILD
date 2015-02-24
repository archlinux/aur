# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_python=python
pkgname=$_python-elmextensions
pkgdesc="${_python^} library that contains a few more complex elementary objects for easy importing/usage"
pkgver=0.1.0
pkgrel=1
arch=('any')
url='https://github.com/JeffHoogland/python-elm-extensions'
license=('BSD')
depends=("$_python-efl")
source=("https://github.com/JeffHoogland/python-elm-extensions/archive/$pkgver.tar.gz")
sha256sums=('69d82dd1c2c87be12b4e159366b920d3bfa3d890bc929c7b26f2eb4edc28a6a1')

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