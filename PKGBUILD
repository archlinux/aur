# Maintainer: James Kittsmiller (AJSlye) <james at nulogicsystems dot com>
# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
pkgname='python-elmextensions'
pkgdesc='Python library that contains a few more complex elementary objects for easy importing/usage'
pkgver='0.2.0'
pkgrel=1
arch=('any')
url='https://github.com/JeffHoogland/python-elm-extensions'
license=('BSD')
depends=('python-efl')
source=('https://github.com/JeffHoogland/python-elm-extensions/archive/0.2.0.tar.gz')
sha256sums=('bdda3b8ca9fc9aca43dcd8a65372d0903b28999fd2c4d8a36110dc77ddf0e6be')

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
