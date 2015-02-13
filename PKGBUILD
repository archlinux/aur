# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=('python-elmextensions-git' 'python2-elmextensions-git')
pkgver=r63.74ed51a
pkgrel=1
arch=('any')
url='https://github.com/JeffHoogland/python-elm-extensions'
license=('BSD')
makedepends=('git')
source=("git://github.com/JeffHoogland/python-elm-extensions.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/python-elm-extensions"

  printf "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package_python-elmextensions-git() {
  pkgdesc="${pkgname%%-*} library that contains a few more complex elementary objects for easy importing/usage"
  depends=("${pkgname%%-*}-efl")
  provides=("${pkgname%-*}=$pkgver")
  conflicts=("${pkgname%-*}")

  cd "$srcdir/python-elm-extensions"

  local _pyver="$(pkg-config --modversion python3)"
  install -d "$pkgdir/usr/lib/python$_pyver/site-packages/elmextensions/"
  install -m644 elmextensions/*.py "$pkgdir/usr/lib/python$_pyver/site-packages/elmextensions/"

# compile python files
  ${pkgname%%-*} -m compileall -q "$pkgdir"
  ${pkgname%%-*} -O -m compileall -q "$pkgdir"

# install license files
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

package_python2-elmextensions-git() {
  pkgdesc="${pkgname%%-*} library that contains a few more complex elementary objects for easy importing/usage"
  depends=("${pkgname%%-*}-efl")
  provides=("${pkgname%-*}=$pkgver")
  conflicts=("${pkgname%-*}")

  cd "$srcdir/python-elm-extensions"

  local _pyver="$(pkg-config --modversion python2)"
  install -d "$pkgdir/usr/lib/python$_pyver/site-packages/elmextensions/"
  install -m644 elmextensions/*.py "$pkgdir/usr/lib/python$_pyver/site-packages/elmextensions/"

# compile python files
  ${pkgname%%-*} -m compileall -q "$pkgdir"
  ${pkgname%%-*} -O -m compileall -q "$pkgdir"

# install license files
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}