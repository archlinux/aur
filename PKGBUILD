# Maintainer: Daniel Pagan (dayynn) <dpagan at gatech dot edu>
pkgname='python-elmextensions-git'
pkgdesc='Python library that contains a few more complex elementary objects for easy importing/usage'
pkgver='0.2.1.rc.2'
pkgrel=1
arch=('any')
url='https://github.com/JeffHoogland/python-elm-extensions'
license=('BSD')
depends=('python-efl')
source=('https://github.com/JeffHoogland/python-elm-extensions/archive/0.2.1.rc.2.tar.gz')
sha256sums=('36987525267d9bc3bebeb3773aa00fea97186ed02b037eac049e8accdbccc26a')

package() {

cd "$srcdir/python-elm-extensions-$pkgver"

local _pyver="$(pkg-config --modversion python3)"
install -d "$pkgdir/usr/lib/python$_pyver/site-packages/elmextensions/"
install -m644 elmextensions/*.py "$pkgdir/usr/lib/python$_pyver/site-packages/elmextensions/"

# compile python files
python -m compileall -q "$pkgdir"
python -O -m compileall -q "$pkgdir"

# install license files
install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgbase}/license.txt"
}
