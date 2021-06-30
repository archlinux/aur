# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
_projectname='olefile'
pkgname="python2-$_projectname"
pkgver='0.46'
pkgrel='4'
pkgdesc='Python library to parse, read and write Microsoft OLE2 files (formerly OleFileIO_PL) - python2 version'
arch=('any')
url="https://www.decalage.info/$_projectname"
license=('BSD')
depends=('python2')
makedepends=('python2')
checkdepends=('python2-pytest')
replaces=('python2-olefileio')
conflicts=('python2-olefileio')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/decalage2/$_projectname/archive/v$pkgver.tar.gz")
sha256sums=('11d1a3810e50956c9360a4c76f1ecebf3e54f9d8406f75127bd0d296638488f4')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py build
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	py.test2
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 'LICENSE.txt' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' 'doc/'*'.rst' -t "$pkgdir/usr/share/doc/$pkgname"
}
