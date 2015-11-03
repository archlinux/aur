# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_python=python2
pkgname=$_python-elmextensions
pkgdesc="${_python^} library that contains a few more complex elementary objects for easy importing/usage"
pkgver=0.2.0
pkgrel=1
arch=('any')
url='https://github.com/JeffHoogland/python-elm-extensions'
license=('BSD')
depends=("$_python-efl")
source=("https://github.com/JeffHoogland/python-elm-extensions/archive/$pkgver.tar.gz")
sha256sums=('bdda3b8ca9fc9aca43dcd8a65372d0903b28999fd2c4d8a36110dc77ddf0e6be')

package() {
  cd python-elm-extensions-$pkgver

  [[ "$_python" = "python" ]] && _python=python3
  local _pyver="$(pkg-config --modversion $_python)"
  install -Dm644 elmextensions/*.py -t "$pkgdir/usr/lib/python$_pyver/site-packages/elmextensions/"

# compile python files
  $_python -m compileall -q "$pkgdir"
  $_python -O -m compileall -q "$pkgdir"

# install license files
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
